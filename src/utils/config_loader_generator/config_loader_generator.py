# Written by Mutlu Polatcan
# 21.10.2019

import yaml
import sys


class Constants:
    KEY_CONFIG_FILES = "config_files"
    KEY_CONFIG_LOADER_SH_TEMPLATE = "config_loader_sh_template"
    KEY_OUTPUT_DIR = "output_dir"
    KEY_PATH = "path"
    KEY_FILENAME = "filename"
    CONFIG_LOADER_STD_STATEMENT_FMT = "load_config \"{property}\" \"${{{env_var_name}:={env_var_value}}}\" \"{config_filename}\""
    CONFIG_LOADER_SUBST_STATEMENT_FMT = "load_config \"{property}\" \"{substitution}\" \"{config_filename}\""
    CONFIG_LOADER_OPT_SUBST_STATEMENT_FMT = "load_config_with_opt \"{property}\" \"{check}\" \"{substitution_not_null}\" \"{substitution_null}\" \"{config_filename}\""
    CONFIGURATION_TAG_WRITE_FMT = "printf \"<configuration>\\n\" > \"${{HBASE_CONF_DIR}}/{filename}\""
    CONFIGURATION_TAG_APPEND_FMT = "printf \"</configuration>\" >> \"${{HBASE_CONF_DIR}}/{filename}\"\n"


class ConfigLoaderGenerator:
    def __init__(self, config_filename):
        self.__config = yaml.safe_load(open(config_filename, "r"))

    def __get_infos(self, data, config_filename, prefix=None):
        load_fn_calls = []

        for property, value in data.items():
            property_name = prefix + "." + property if prefix else property

            if isinstance(value, dict):
                load_fn_calls.extend(self.__get_infos(value, config_filename, property_name))
            else:
                property_name = property_name[:-1] if property_name[-1] == "." else property_name
                env_var_name = property_name.upper().replace(".", "_").replace("-", "_")

                if value.find("=") == 0:  # standard load config statement
                    load_fn_calls.append(Constants.CONFIG_LOADER_SUBST_STATEMENT_FMT.format(
                        property=property_name, substitution=value[1:], config_filename=config_filename)
                    )
                elif value.find("?") == 0:  # optional load config statement
                    tokens = value.split(",")

                    load_fn_calls.append(Constants.CONFIG_LOADER_OPT_SUBST_STATEMENT_FMT.format(
                        property=property_name, check=tokens[0][1:], substitution_not_null=tokens[1], substitution_null=tokens[2], config_filename=config_filename
                    ))
                else:
                    load_fn_calls.append(
                        Constants.CONFIG_LOADER_STD_STATEMENT_FMT.format(property=property_name,
                                                                         env_var_name=env_var_name,
                                                                         env_var_value=value,
                                                                         config_filename=config_filename)
                    )

        return load_fn_calls

    def generate(self):
        load_fn_calls = []

        for config_info in self.__config[Constants.KEY_CONFIG_FILES]:
            config_file_path = config_info[Constants.KEY_PATH]
            config_filename = config_info[Constants.KEY_FILENAME]

            _load_fn_calls = self.__get_infos(yaml.safe_load(open(config_file_path, "r")), config_filename)
            _load_fn_calls.insert(0, Constants.CONFIGURATION_TAG_WRITE_FMT.format(filename=config_filename))
            _load_fn_calls.append(Constants.CONFIGURATION_TAG_APPEND_FMT.format(filename=config_filename))
            load_fn_calls.extend(_load_fn_calls)

        open("{loc}/config_loader.sh".format(loc=self.__config[Constants.KEY_OUTPUT_DIR]), "w").write(
            self.__config[Constants.KEY_CONFIG_LOADER_SH_TEMPLATE].format(load_fn_calls="\n".join(load_fn_calls))
        )


if __name__ == "__main__":
    ConfigLoaderGenerator(sys.argv[1]).generate()
