VERSION:=$(shell echo $(BRANCH) | sed s/release\\///)
GITHUB_TOKEN?=

release:
	$(MAKE) changelog
	$(MAKE) npm/version

npm/version:
	npm version $(VERSION) -m "chore: release %s." 
	git push origin $(BRANCH)
	git push --tags

changelog:
	docker run -it --rm -v "$(shell pwd)":/usr/local/src/your-app ferrarimarco/github-changelog-generator --user ryokosuge --project changelog-generator-sample --token $(GITHUB_TOKEN) --future-release v$(VERSION)
	git commit -a -m "doc: Update CHANGELOG"
	git push origin $(BRANCH)