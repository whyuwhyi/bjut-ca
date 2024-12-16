EXEC = ./simplesim-3.0/sim-cache

TEST_NAME = test-printf
DIR = ./benchmark/bin.little/

CONFIG_PATH = ./config/
OUTPUT_PATH = ./result/$(TEST_NAME)/

CONFIG_FILES = $(wildcard $(CONFIG_PATH)*)
OUTPUT_FILES = $(patsubst $(CONFIG_PATH)%, $(OUTPUT_PATH)%,$(CONFIG_FILES))

sim: pre $(OUTPUT_FILES)

pre:
	mkdir -p $(OUTPUT_PATH)

$(OUTPUT_PATH)%: $(CONFIG_PATH)%
	$(EXEC) -config $< -redir:sim $@ $(DIR)$(TEST_NAME)

.PHONY: pre sim
