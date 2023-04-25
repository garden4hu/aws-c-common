# Why another forking?
为了满足个人需要。

## 修改了什么？
添加了三个文件，包括本文件：

+ configure : 用于生成 Makefile 需要的配置文件
+ Makefile
+ README_CN.md ： 本文件，用于介绍说明

## 如何使用？

```bash
sh configure && make
```

## 有那么功能？
支持 Linux 平台生成动态库。支持一些参数，如下：

```bash
Usage: configure [options]
Options: 
    --cc=<compiler>         : set C compiler
    --cxx=<compiler>        : set C++ compiler
    --extra-cflags=<cflags> : set extra cflags
    --release               : enable release
    --static                : enable static only
    --disable-cpu-extension : disable cpu extension, default is enable
    --hide-cjson-symbol     : hide cjson symbol, default is not hide
    -h, --help              : help messages
```

## 不支持什么？

+ Fuzzy 测试，测试
+ Sanitizer
+ install
+ APPLE/BSD/Windows 平台编译
+ ...

你可以理解为仅支持 Linux 平台库的生成，且不包含任何 Test 代码和程序。