VERSION:=$(shell echo $(BRANCH) | sed s/release\\///)
GITHUB_TOKEN?=

release:
	# $(MAKE) npm/version
	$(MAKE) changelog

npm/version:
	npm version $(VERSION) -m "release %s." 

changelog:
	docker run -it --rm -v "$(shell pwd)":/usr/local/src/your-app ferrarimarco/github-changelog-generator --user ryokosuge --project changelog-generator-sample --token $(GITHUB_TOKEN)
	git diff CHANGELOG.md