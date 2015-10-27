# Rails Websocket

EM を使用したチャットアプリプロトタイプを Rails で作成。

Websocket は EM で実現。

フロントフレームワークは Mithril を採用。

## サーバ起動

```
$ bundle install
$ rake db:migrate
$ rails s
```

## デーモン起動

```
$ ruby lib/websocket/subscriber.rb run
```

*localhost 3001 番で起動する*
