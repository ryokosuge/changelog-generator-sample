RELEASE_VERSION?=$(shell echo $(RELEASE_BRANCH) | sed s/release\\///)
GITHUB_TOKEN?=

release:
	$(MAKE) changelog
	$(MAKE) npm/version

release-version-tag:
	npm version $(RELEASE_VERSION) -m "tag: release %s."

changelog:
	github-changelog-generator \
		--user ryokosuge \
		--project changelog-generator-sample \
		--exclude-labels release \
		--future-release v$(RELEASE_VERSION) \
		--token $(GITHUB_TOKEN)
