#!/bin/bash

# Proxy settings
PROXY_HOST="10.145.10.30"
PROXY_PORT="80"
PROXY_USER="Fullaccess"
PROXY_PASS="Bhilai123"

# Function to set proxy
set_proxy() {
    export http_proxy="http://$PROXY_USER:$PROXY_PASS@$PROXY_HOST:$PROXY_PORT/"
    export https_proxy="http://$PROXY_USER:$PROXY_PASS@$PROXY_HOST:$PROXY_PORT/"
    export ftp_proxy="http://$PROXY_USER:$PROXY_PASS@$PROXY_HOST:$PROXY_PORT/"
    export no_proxy="localhost,127.0.0.1,::1"

    # For apt
    echo "Acquire::http::Proxy \"http://$PROXY_USER:$PROXY_PASS@$PROXY_HOST:$PROXY_PORT/\";" | sudo tee /etc/apt/apt.conf.d/95proxies > /dev/null
    echo "Acquire::https::Proxy \"http://$PROXY_USER:$PROXY_PASS@$PROXY_HOST:$PROXY_PORT/\";" | sudo tee -a /etc/apt/apt.conf.d/95proxies > /dev/null

    # For git
    git config --global http.proxy "http://$PROXY_USER:$PROXY_PASS@$PROXY_HOST:$PROXY_PORT/"
    git config --global https.proxy "http://$PROXY_USER:$PROXY_PASS@$PROXY_HOST:$PROXY_PORT/"

    echo "Proxy has been set."
}

# Function to unset proxy
unset_proxy() {
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset no_proxy

    # For apt
    sudo rm -f /etc/apt/apt.conf.d/95proxies

    # For git
    git config --global --unset http.proxy
    git config --global --unset https.proxy

    echo "Proxy has been unset."
}

# Function to show current proxy settings
show_proxy() {
    echo "Current proxy settings:"
    echo "http_proxy: $http_proxy"
    echo "https_proxy: $https_proxy"
    echo "ftp_proxy: $ftp_proxy"
    echo "no_proxy: $no_proxy"
}

# Main menu
while true; do
    echo ""
    echo "Proxy Manager"
    echo "1. Set Proxy"
    echo "2. Unset Proxy"
    echo "3. Show Current Proxy Settings"
    echo "4. Exit"
    read -p "Choose an option: " choice

    case $choice in
        1) set_proxy ;;
        2) unset_proxy ;;
        3) show_proxy ;;
        4) break ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done

echo "Exiting Proxy Manager."
