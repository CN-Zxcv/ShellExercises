#!/bin/sh

# 向shell脚本传递的参数会转变为位置变量, 从$1 .. $9;
# 还有特殊的 $0 为执行的命令字符串


# $ WithArgs.sh Hello World
# WithArgs.sh
# Hello
# World

echo $0
echo $1
echo $2

# 传递的多余参数会被忽略

# $ WithArgs.sh Hello World Mouse Cheese
# WithArgs.sh
# Hello
# World

# 传递过少的参数，访问到的参数值为空
# $ WithArgs.sh Hello
# WithArgs.sh
# Hello

# 默认情况参数按空格分隔
# 如果需要传递带空格的参数，需要用引号包围，
# $ WithArgs.sh 'Hello World' "Mouse Cheese"
# WithArgs.sh
# Hello World
# Mouse Cheese

# 将传递进来的参数左移n个，$k -> $k - n
# $0 不会改变
# 0 <= n <= k
shift $# - 1

echo "[ shift 1 ] ^"
echo $0
echo $1
echo $2

echo "[ shift 1 ] $"


# 特殊变量

# 当前传递进来的参数个数
echo '$#' $#


# 当前shell set 参数(在脚本中执行为空是为什么？)
echo '$-' $-

# 上个命令的执行结果 (0:success, otherwise:error)
echo '$?' $?

# 当前进程号
echo '$$' $$

# Shell最后运行的后台Process的PID
echo '$!' $!

# 将传给脚本的所有参数组成一个字符串,
echo '$*' $*

# 输出所有传给脚本的参数，
echo '$@' $@

# $* 和 $@ 都表示传递给函数或脚本的所有参数，
# 不被双引号(" ")包含时，都以"$1" "$2" … "$n" 的形式输出所有参数。
# 但是当它们被双引号(" ")包含时，
# "$*" 会将所有的参数作为一个整体，以"$1 $2 … $n"的形式输出所有参数；
# "$@" 会将各个参数分开，以"$1" "$2" … "$n" 的形式输出所有参数。
