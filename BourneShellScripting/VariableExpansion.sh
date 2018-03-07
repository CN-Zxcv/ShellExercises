#!/bin/sh

# var=value
# 之间不能有空格

ANIMAL=duck

# 使用 ${var} 引用变量， 
# 可以缩写为 $var, 缩写方式后面不能跟可作为变量的字符
# 可以使用 ${var[:]-default} 设置默认值,冒号是可选的
echo One $ANIMAL, two $ANIMALs, three ${ANIMAL}s, four ${PLANT:-dog}s

# ${var[:]=default} 在返回默认值的同时为变量设置默认值,冒号可选
echo $VAL
echo ${VAL:=newval}
echo $VAL

# ${var[:]+substitute} 如果变量已经定义，则返回替换值
# 通常用于在脚本中检查某个变量是否有值
#if ${VAR:+optionset} == optionset then

# ${var[:]?message} 检查变量是否有值，
# 没有值则输出message并退出脚本
echo ${VAR:?has not been set}
# -sh : VAR : has not been set
echo ${VAR:?}
# -sh : VAR : parameter null or not set
