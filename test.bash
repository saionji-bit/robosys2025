#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 yuki saionji
# SPDX-License-Identifier: BSD-3-Clause

ng () {
        echo ${1}行目が違うよ
        res=1
}

res=0

### NORMAL INPUT ###
out=$(seq 5 | ./plus)
[ "${out}" = 15 ] || ng "$LINENO"

### STRANGE INPUT ###
# 文字が混ざったとき
out=$(echo あ | ./plus)
[ "$?" = 1 ]      || ng "$LINENO"   # 失敗しているはず
[ "${out}" = "" ] || ng "$LINENO"   # 標準出力は空のはず

# 何も数字が来ないとき（空行だけ）
out=$(echo | ./plus)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res

