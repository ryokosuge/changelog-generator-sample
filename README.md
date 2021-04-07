# changelog-generator-sample

## release flow

GitHub Actionsで以下の処理が実行されるようになってます

1. CHANGELOGの生成
    - [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)を使ってます
2. `npm version`で`package.json`のバージョンをあげてます
3. release用のPRを作成
4. git tagでリリースするバージョンのtagを生成してpush
5. GitHubのreleaseを作成

開発者がやるのは以下の2つ

1. `release/${リリースするバージョン}`ブランチを作成してpush

```sh
git switch -c release/${VERSION}
git push origin release/${VERSION}
```

2. PRをmainにmerge
    - PRの中身はpackage.jsonのversion upとCHANGELOGの追加のみになる
    - CHANGELOGの中身、package.jsonの中身が問題なければmergeで問題なし