function proxy_on() {
    export server=127.0.0.1
    export port=1087

    export http_proxy="http://$server:$port/"
    export https_proxy=$http_proxy
    export ftp_proxy=$http_proxy
    export rsync_proxy=$http_proxy
    export HTTP_PROXY=$http_proxy
    export HTTPS_PROXY=$http_proxy
    export FTP_PROXY=$http_proxy
    export RSYNC_PROXY=$http_proxy
    export all_proxy=$http_proxy
    export ALL_PROXY=$http_proxy
}

function proxy_off(){
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset rsync_proxy
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset FTP_PROXY
    unset RSYNC_PROXY
    unset all_proxy
    unset ALL_PROXY
    echo -e "Proxy environment variable removed."
}
