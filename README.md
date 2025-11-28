# robosys2025
![test](https://github.com/saionji-bit/robosys2025/actions/workflows/test.yml/badge.svg)

ロボットシステム学の練習用リポジトリ  
授業で作成した `plus` コマンドなどを置く

## plus コマンド

標準入力から読み込んだ数値を足す。

### 使い方

```bash
# 実行権限を付ける（初回のみ）
chmod +x plus

# 1〜5 を足し算
seq 5 | ./plus
# => 15

# 小数を含む場合
printf "1.5\n2.5\n" | ./plus
# => 4.0

## 必要なソフトウェア

- Python 3
  - テスト済みバージョン: 3.10

## テスト環境

- GitHub Actions の `ubuntu-latest`
- WSL2 上の Ubuntu

## ライセンス・著作権

- このソフトウェアパッケージは 3 条項 BSD ライセンスの下で再頒布および使用が許可されています。
- 詳細は同梱の `LICENSE` ファイルを参照してください。
- © 2025 yuki saionji

一部のコードや手順は、千葉工業大学 上田隆一「ロボットシステム学」の講義資料を参考にして作成しています。

