
# 一般函数
# name () command group
# >name

# group 可以是任何group方式 {} 或者 ()
# {} 在本进程执行
# () 在子进程执行

hw() {
    echo 'Hello World';
}

hw1() ( echo 'Hello World' )


# 带参函数
# functionWithParams (ARG0, ARG1) { do something with ARG0 and ARG1 }
# functionWithParams arg1 arg2
# 因为函数的本质就是特殊的shell变量，可以被当作可执行alias
# 所以也遵守脚本参数传递规则 $0 $1 .. $9

