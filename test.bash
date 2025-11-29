#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 yuki saionji
# SPDX-License-Identifier: BSD-3-Clause

ng () {
        echo ${1}行目が違うよ
        res=1
}

res=0

### NORMAL INPUT (plus) ###
out=$(seq 5 | ./plus)
[ "${out}" = 15 ] || ng "$LINENO"

### STRANGE INPUT (plus) ###
# 文字が混ざったとき
out=$(echo あ | ./plus)
[ "$?" = 1 ]      || ng "$LINENO"   # 失敗しているはず
[ "${out}" = "" ] || ng "$LINENO"   # 標準出力は空のはず

# 何も数字が来ないとき（空行だけ）
out=$(echo | ./plus)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"


### NORMAL INPUT for closet ###
clothes_input='冬,コート,黒,ダウン\n夏,Tシャツ,白,UT\n'
out=$(printf "$clothes_input" | ./closet)

expected="冬:
  コート 黒 ダウン
夏:
  Tシャツ 白 UT"

[ "${out}" = "${expected}" ] || ng "$LINENO"


### STRANGE INPUT for closet ###
# フォーマットが不正な行 → エラー
out=$(echo "不正な行,カテゴリ,色" | ./closet)
[ "$?" = 1 ]      || ng "$LINENO"   # 終了コード1のはず
[ "${out}" = "" ] || ng "$LINENO"   # 標準出力は空のはず（エラーはstderr）

# 空入力 → エラー
out=$(echo | ./closet)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"


[ "${res}" = 0 ] && echo OK   # ★ここをいちばん下に1回だけ
exit $res

