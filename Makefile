RELEASE_VERSION?=$(shell echo $(RELEASE_BRANCH) | sed s/release\\///)
GITHUB_TOKEN?=

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
