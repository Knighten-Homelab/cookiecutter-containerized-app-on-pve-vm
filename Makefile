SOURCE_DIR := $(basename $(PWD))
TEST_ZIP := cookiecutter.zip

generate:
	zip -r $(TEST_ZIP) $(SOURCE_DIR) --exclude $(SOURCE_DIR)/$(TEST_ZIP) --quiet; \
	mv $(TEST_ZIP) $(SOURCE_DIR)/$(TEST_ZIP); \
	echo  "Cookiecutter full path: $(PWD)/$(TEST_ZIP)";
	cookiecutter $(PWD)/$(TEST_ZIP) --overwrite-if-exists; \

test:
	zip -r $(TEST_ZIP) $(SOURCE_DIR) --exclude $(SOURCE_DIR)/$(TEST_ZIP) --quiet; \
	mv $(TEST_ZIP) $(SOURCE_DIR)/$(TEST_ZIP); \
	echo  "Cookiecutter full path: $(PWD)/$(TEST_ZIP)";
	cookiecutter $(PWD)/$(TEST_ZIP) --no-input --overwrite-if-exists; \