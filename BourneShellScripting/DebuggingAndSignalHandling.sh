#!/bin/sh 


DIVISOR=${1:-0}
echo $DIVISOR
expr 12 / $DIVISOR

# sh -x 
# 输出所有的执行结果

# + DIVISOR=0
# + echo 0
# 0
# + expr 12 / 0


# sh -v 
# 输出所有的执行命令

# DIVISOR=${1:-0}
# echo $DIVISOR
# 0
# expr 12 / $DIVISOR


# -xv 可以合起来用


# 上面可以接参数, 变成 !/bin/sh -xv
# 但是这种形式只能使用 ./xx.sh 的方式执行才有效
# 因为 sh xxx.sh 或者 . xxx.sh 都是将文本作为参数传入的，命令本身并没有携带参数启动


# 中断脚本执行
# exit [n]

# 退出函数
# return [n]

# 
# trap [command string] signal0 [signal1] ...

trap "echo Hello World" 16

trap "echo Hello World" SIGUSR1

# SIGXXXX

# ERR 不是一个真正的signal , 是用来捕捉当前脚本执行错误的
# 和exception 或者lua的 __TRACE_BACK__ 比较像
# 但是这不是POSIX的一部分, 不具备移植性
trap "echo Hello World" SIGUSR1


