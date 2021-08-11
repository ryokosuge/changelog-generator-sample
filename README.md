# changelog-generator-sample

## release flow

GitHub Actionsで以下の処理が実行されるようになってます

1. CHANGELOGの生成
    - [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)を使ってます
2. `npm version`で`package.json`のバージョンをあげてます
3. git add & commit & push をします
4. GitHubのreleaseを作成

まで終わったら自動でリリース完了

開発者がやるのは以下の2つ

1. workflow_dispatchの実行
    - release jobを実行します
        - リリースするバージョンは絶対に指定する必要があります
