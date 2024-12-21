# ja-vpngate-proxy

[VPNGate](http://www.vpngate.net/api/iphone/)から日本のVPNサーバだけを抽出してランダムに接続します  
[hostproxy](https://github.com/ateliersjp/hostproxy) の機能により、絶対URI(プロキシ)と相対URI(通常のアクセス)の両方で使用できます。

> また、日本サーバであってもpublic-vpn-から始まるVPN(219.100.37.0/24)は同じ場所からのアクセスになってしまうため除外しました

# 起動

```bash
docker run --rm -it \
--cap-add=NET_ADMIN --device=/dev/net/tun \
--dns=1.1.1.1 --dns=8.8.8.8 --dns=9.9.9.9 \
-p 8118:8118 \
ateliersjp/ja-vpngate-hostproxy -p 8118
```

# 起動確認

proxy指定有り無しでcurlしてグローバルIPが異なっていれば成功です
絶対URI(-x有り)と相対URI(-x無し)のグローバルIPは同じになります

```bash
$ curl inet-ip.info
$ curl inet-ip.info -x http://localhost:8118
$ curl localhost:8118/http://inet-ip.info
```