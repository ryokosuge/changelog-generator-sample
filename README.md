# changelog-generator-sample

## release flow

### release/** をpush

```sh
git switch -c release/${VERSION}
git push origin release/${VERSION}
```

### PRの確認

- release ${VERSION} のPRをチェック
- 問題なければmerge

### merge後tag（予定）

- git tagでリリースバージョンが打たれる