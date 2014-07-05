#!/bin/bash

## variables
# echo color - example echo -e "\e[30m", the output will be black
# echo -e "\e[0m" is uesd to restore the default output setting
# 0-黑色 1-红色 2-绿色 3-橘黄色 4-蓝色 5-紫色 6-淡蓝色 7-白色
# font color 30 - 37
# "\e[30m" "\e[31m" "\e[32m" "\e[33m" "\e[34m" "\e[35m" "\e[36m" "\e[37m"
# background color 40 - 47
# "\e[40m" "\e[41m" "\e[42m" "\e[44m" "\e[44m" "\e[45m" "\e[46m" "\e[47m"
colorRed()
{
    echo -e "\e[31m"
}
colorWhite()
{
    echo -e "\e[37m"
}
colorYellow()
{
    echo -e "\e[33m"
}
colorNormal()
{
    echo -e "\e[0m"
}

####
cart="mysql-5.1"
# array
carts=( mongodb-2.4 mysql-5.1 mysql-5.5 postgresql-8.4 postgresql-9.2 )
# size of array 数组大小固定写法#carts[@]
numCarts=${#carts[@]}
# add the cartridge radom
# $RANDOM 0-32767, 数组必须用${}取值
cartsuffix=$(($RANDOM % $numCarts))
cart=${carts[$cartsuffix]}
####

## function defined

#log the failed message to the log
logerr()
{
    if [ "$?" -ne "0" ]
    then
        echo "$1 $2 failed" >> $log
        #echo "$1 $2 failed"
        exit
    fi

}

# log the successful message to the log
logok()
{
    echo "$1 $2 successful" >> $log
}

# record the log created time to the log
logdateTime()
{
    echo "---------------------------`date +%Y%m%d%H%M`---------------------------" >> $log
}

