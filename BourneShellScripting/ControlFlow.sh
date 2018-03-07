#!/bin/sh

# test condition , 条件检查，返回true false
# 会按exit status 输出 ($?); 0:true, otherwise:false
# 可以缩写为 [ condition ] , 中括号两边必须要留空格

test "Hello" = "Hello"
echo "Hello" = "Hello"  $?
test "Hello" != "Hello"
echo "Hello" != "Hello" $?

# test 参数

# 文件存在并且是二进制文件
[ -b file ]

# 文件存在并且是文本文件
[ -c file ]

# 文件存在并且是目录
[ -d file ]

# 文件存在
[ -f file ]

# file exists and has its set-group-id bit set
[ -g file ]

# file exists and has its sticky bit set
[ -k file ]

# file exists and has its set-user-id bit set
[ -u file ]

# file exists and is a named pipe
[ -p file ]

# 文件存在并且可读
[ -r file ]

# 文件存在并且可写
[ -w file ]

# 文件存在并且可执行
[ -x file]

# 文件存在并且大小大于0k
[ -s file ]

# The open file descriptor with number n is a terminal device; n is optional, default 1
[ -t [n] ]

############ string

# 长度大于0
[ -n string ]

# 长度等于0
[ -z string ]

# s0等于s1
[ s0 = s1 ]

# s0不等于s1
[ s0 != s1 ]

# 不为空
[ string ]

############ integer
# 算数比较可以使用更直观的let语法, let 'commmand'
# 同时let也有语法糖 (( command ))

# n0 == n1
[ n0 -eq n1 ]

# let 'n0 == n1'
# (( n0 == n1 ))

# n0 >= n1
[ n0 -ge n1 ]

# n0 > n1
[ n0 -gt n1 ]

# n0 <= n1
[ n0 -le n1 ]

# n0 < n1
[ n0 -lt n1 ]

# n0 != n1
[ n0 -ne n1 ]

# group
[ \( B \) ]

########### Boolean
# bool比较 语法糖为
# [[ command ]]

test -d /tmp && test -r /tmp
[[ -d /tmp && -r /tmp]]

# not 
[ ! B ]

# and
[ B0 -a B1 ]

# or
[ B0 -o B1 ]




########### 

# if command 与then不能直接放到一行
# 可以使用加分号的方式 if command; then 

if command
then command
elif command
then command
...
else command
fi


case value in
pattern0 ) command ;;
pattern1 ) command ;;
...
* ) command ;;
esac


while command
do 
    command
done

until command
do
    command
done

# 
for name in w1 w2 ...
do
    command
done

# for 的简写使用 $* 作为参数
for arg
do
    echo $arg
done

############ 串联命令

# and
command0 && command1

# or 
command0 || command1

# sequence
command0 ; command1

# group 
{ command0 ; command1 }

/home$ { mkdir newdir; cd newdir; }
#>/home/newdir

# seprate process 
# ()中的代码会在另外的进程执行，不会影响当前进程
( command0; command1 )

/home$ ( mkdir newdir; cd newdir; )
#>/home$


############# Command substitution

# 使用 `command` 或者 $( command )
# 与上面group的区别？？


# shell 自带支持部分正则表达式
# *, ?, [characters], [!characters], pat0|pat1
# | 只能用在case里面
# 当用正则筛选文件时，默认不选择隐藏文件
# 转义
# \ 转义单个字符
# '' 转义所有字符为字面值
# "" 禁用所有特殊字符 除了 ``, $(), "

ls *.dat
ls file-??.txt
for i in *.txt; do cp $i backup/$i-`date +%Y%m%d`; done
ls Backup[01]
ls Backup[!01]
myscript*.sh
