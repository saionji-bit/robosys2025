# robosys2025
![test](https://github.com/saionji-bit/robosys2025/actions/workflows/test.yml/badge.svg)

ロボットシステム学の練習用リポジトリです。  

## 目次

- plus コマンド
- closet コマンド
- テスト
- 必要なソフトウェア
- テスト環境
- ライセンス・著作権

授業で作成した `plus` コマンドや，服の一覧を表示する `closet` コマンドを置いています。

## インストール方法

このリポジトリをクローンして，スクリプトに実行権限を付けると使えます。

```bash
$ git clone git@github.com:saionji-bit/robosys2025.git
$ cd robosys2025
$ chmod +x plus closet

## plus コマンド

標準入力から読み込んだ整数や小数を足し合わせて，合計を標準出力に表示するコマンドです。

### 使い方

```bash
# 実行権限を付ける（初回のみ）
$ chmod +x plus

# 1〜5 を足し算
$ seq 5 | ./plus
15

# 小数を含む場合
$ printf "1.5\n2.5\n" | ./plus
4.0

