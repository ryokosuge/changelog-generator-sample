RELEASE_BRANCH?=
RELEASE_VERSION?=$(shell echo $(RELEASE_BRANCH) | sed s/release\\///)
GITHUB_TOKEN?=
OUTPUT_FILE?=release_note.md

release:
	$(MAKE) changelog
	$(MAKE) npm/version

release_version_tag:
	npm version $(RELEASE_VERSION)

changelog:
	github_changelog_generator \
		--user ryokosuge \
		--project changelog-generator-sample \
		--exclude-labels release \
		--future-release v$(RELEASE_VERSION) \
		--token $(GITHUB_TOKEN)

release_note:
	github_changelog_generator \
		--user ryokosuge \
		--project changelog-generator-sample \
		--exclude-labels release \
		--future-release v$(RELEASE_VERSION) \
		--since-tag $(shell git tag | tail -n 1 | head -n 1) \
		--output $(OUTPUT_FILE) \
		--token $(GITHUB_TOKEN)
