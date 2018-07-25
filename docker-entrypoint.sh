#!/bin/bash
set -e

if [ -z $SERVER_PORT ];then
	SERVER_PORT=21
fi
if [ -z $PASSWORD ];then
	PASSWORD=9a77c93d5261
fi
if [ -z $METHOD ];then
	METHOD=aes-256-cfb
fi
if [ -z $MANAGER_ADDRESS ];then
	MANAGER_ADDRESS=127.0.0.1:6001
fi
echo "{\"server\":\"0.0.0.0\",\"server_port\":$SERVER_PORT,\"local_port\":1080,\"password\":\"$PASSWORD\",\"timeout\":60,\"method\":\"$METHOD\"}" > /etc/shadowsocks-libev/config.json
exec /usr/bin/ss-server -c /etc/shadowsocks-libev/config.json -u --manager-address $MANAGER_ADDRESS