 # set proxy config via profie.d - should apply for all users
export http_proxy="http://127.0.0.1:7890/"
export https_proxy="http://127.0.0.1:7890/"
export ftp_proxy="http://127.0.0.1:7890/"
export no_proxy="127.0.0.1,localhost"
# For curl
export HTTP_PROXY="http://127.0.0.1:7890/"
export HTTPS_PROXY="http://127.0.0.1:7890/"
export FTP_PROXY="http://127.0.0.1:7890/"
export NO_PROXY="127.0.0.1,localhost"
#将要从代理中排除的其他IP添加到NO_PROXY和no_proxy环境变量中

env | grep proxy
