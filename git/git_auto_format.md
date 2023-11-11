# 提交代码时自动格式化代码
在项目的.git/hooks/pre-commit 创建以下内容，每次commit时，会格式化待提交的C++代码

[pre-commit](../src/scripts/tools-config/git-cfg/pre-commit)

```shell

#!/bin/bash

format_file() {
  file="${1}"
  echo "---> format ${file}"
  clang-format -i --style=file ${file}
  git add ${file}
}

# 注意这里对格式化的文件做了限制，非.cc/.h的文件不格式化，可自行修改
is_need_format() {
  need=1
  file=$1

  if [[ $need -eq 1 ]]; then
    # only c/c++ source file
    if [ x"${file##*.}" != x"c" -a x"${file##*.}" != x"cc" -a x"${file##*.}" != x"h" ]; then
      #echo "$file ==> not c++ file"
      need=0
    fi
  fi

  return $need
}

case "${1}" in
  --about )
    echo "Runs clang-format on source files"
    ;;
  * )
    for file in `git diff-index --cached --name-only HEAD` ; do
      is_need_format ${file}
      if [[ $? -eq 1 ]]; then
        format_file "${file}"
      fi
    done
    ;;
esac

```