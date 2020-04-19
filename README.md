# flowerss bot 容器

适合树莓派使用的 [flowerss bot](https://github.com/indes/flowerss-bot) 容器。

## 安装容器 ##

```bash
git clone https://github.com/LJason77/docker-flowerss-bot.git
cd docker-flowerss-bot
docker build -t flowerss .
```

## 配置 ##

首先，下载官方配置模板到你自己的路径：

```bash
wget -O ~/flowerss/config.yml https://raw.githubusercontent.com/indes/flowerss-bot/master/config.yml.sample
```

或者自己创建一个 config.yml 文件：

```
bot_token:
telegraph_token:
socks5:
update_interval: 10

mysql:
  host:
  port:
  user:
  password:
  database:

telegram:
  endpoint:

sqlite:
  path: ./data.db
```

在这个文件中，最重要的是 **bot_token**，此项必填，获取方法：[ Telegram 官方说明](https://core.telegram.org/bots#3-how-do-i-create-a-bot)

如果主机的环境需要代理才能连接到 Telegram API 服务器，那就需要设置 **socks5**：由于在 docker 里面运行，*127.0.0.1:1080* 可能不起作用，需要使用具体的 ip，如局域网的 192.168.1.2:1080。

其他配置可根据 [官网配置](https://flowerss-bot.now.sh/#/install?id=%e9%85%8d%e7%bd%ae) 去自行设置。

## 运行 ##

```bash
# 注意：~/flowerss 目录下需要存在 config.yml 文件
docker run --restart always --name flowerss -d -v ~/flowerss:/flowerss flowerss
```
