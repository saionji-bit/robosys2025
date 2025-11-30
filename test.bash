#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 yuki saionji
# SPDX-License-Identifier: BSD-3-Clause

ng () {
        echo ${1}行目が違うよ
        res=1
}

res=0

### NORMAL INPUT for closet ###
clothes_input='冬,コート,黒,ダウン\n夏,Tシャツ,白,UT\n'
out=$(printf "$clothes_input" | ./closet)

expected="冬:
  コート 黒 ダウン
夏:
  Tシャツ 白 UT"

[ "$?" = 0 ]                 || ng "$LINENO"
[ "${out}" = "${expected}" ] || ng "$LINENO"

### NORMAL INPUT for closet with comments ###
clothes_input_with_comment='# comment line\n冬,コート,黒,ダウン\n夏,Tシャツ,白,UT\n'
out=$(printf "$clothes_input_with_comment" | ./closet)
[ "$?" = 0 ]                 || ng "$LINENO"
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

### STRANGE INPUT for closet (unexpected arguments) ###
out=$(./closet dummy)
[ "$?" = 1 ]      || ng "$LINENO"   # 引数があるときはエラー終了のはず
[ "${out}" = "" ] || ng "$LINENO"   # 標準出力は空（エラーはstderr）

[ "${res}" = 0 ] && echo OK
exit $res

