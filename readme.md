# Docker for aria2c


## Configuration

`RPC_SECRET`: rpc secret

`DOWNLOAD_DIR`: download dir, default `/downloads`

be careful with `DOWNLOAD_DIR`, it's path inside the container,
you need to mount host path in container.

`CONCURRENT_DOWNLOADS`: limits the number of items which are downloaded concurrently

`SPLIT`: Download a file using N connections. default: `4`

`CONNECTIONS_PER_SERVER`: max connection per server. default: `4`

`USER_AGENT`: download user agent, default aria2c default user agent.

`FILE_ALLOCATION`: Specify file allocation method. default `none`

`ALLOW_OVERWRITE`: default `true`

`AUTO_FILE_RENAMING`:default: `false`


## configuration

you can mount your config file to `/etc/aria2.conf` to override inner config file.

When mounting your own config file, all environment variable won't work.

## usage as bgmi downloader

mount your `$HOME/.bgmi/bangumi` inside the container with same path.

```bash
docker run -v $HOME/.bgmi/bangumi:$HOME/.bgmi/bangumi \
           -v $HOME/Downloads:/downloads \
           -e RPC_SECRET=$YOUR_SECRET \
           -p 6800:6800 \
           -d bgmidocker/aria2
```