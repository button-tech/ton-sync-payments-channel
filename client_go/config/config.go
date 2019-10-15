package config

import (
	"gopkg.in/yaml.v2"
	"io/ioutil"
)

var Cfg *Config

type Config struct {
	FiftCompiler                 string `yaml:"fiftCompiler"`
	FiftLib                      string `yaml:"fifLib"`
	PathToScriptAccountAddress   string `yaml:"accountAddress"`
	PathToScriptSignState        string `yaml:"signState"`
	PathToScriptSend             string `yaml:"send"`
	PathToScriptAccountSignature string `yaml:"accountSignature"`
	PathToScriptWithdraw string `yaml:"withdraw"`
}

func Get(fileName string) (*Config, error) {
	var cnf Config
	data, err := ioutil.ReadFile(fileName)
	if err != nil {
		return nil, err
	}

	err = yaml.Unmarshal(data, &cnf)
	if err != nil {
		return nil, err
	}
	return &cnf, nil
}
