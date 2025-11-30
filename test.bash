#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 yuki hoya
# SPDX-License-Identifier: BSD-3-Clause

ng () {
        echo ${1}行目が違うよ
        res=1
}

res=0

### NORMAL INPUT (closet, stdin) ###
clothes_input='冬,コート,黒,ダウン\n夏,Tシャツ,白,UT\n'
out=$(printf "$clothes_input" | ./closet)

expected="冬:
  コート 黒 ダウン
夏:
  Tシャツ 白 UT"

[ "$?" = 0 ]                 || ng "$LINENO"
[ "${out}" = "${expected}" ] || ng "$LINENO"

### NORMAL INPUT (closet, stdin with comments) ###
clothes_input_with_comment='# comment line\n冬,コート,黒,ダウン\n夏,Tシャツ,白,UT\n'
out=$(printf "$clothes_input_with_comment" | ./closet)
[ "$?" = 0 ]                 || ng "$LINENO"
[ "${out}" = "${expected}" ] || ng "$LINENO"

### NORMAL INPUT (closet, file argument) ###
printf "$clothes_input" > tmp_clothes.txt
out=$(./closet tmp_clothes.txt)
[ "$?" = 0 ]                 || ng "$LINENO"
[ "${out}" = "${expected}" ] || ng "$LINENO"
rm tmp_clothes.txt

### STRANGE INPUT (closet, bad format line) ###
out=$(echo "不正な行,カテゴリ,色" | ./closet)
[ "$?" = 1 ]      || ng "$LINENO"   # 終了コード1のはず
[ "${out}" = "" ] || ng "$LINENO"   # 標準出力は空のはず（エラーはstderr）

### STRANGE INPUT (closet, empty input) ###
out=$(echo | ./closet)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

### STRANGE INPUT (closet, nonexistent file) ###
out=$(./closet does_not_exist.txt)
[ "$?" = 1 ]      || ng "$LINENO"   # 存在しないファイル → エラー
[ "${out}" = "" ] || ng "$LINENO"   # 標準出力は空（エラーはstderr）

[ "${res}" = 0 ] && echo OK
exit $res

