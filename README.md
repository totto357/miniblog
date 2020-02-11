# ミニブログ

日常のふとした思いつきを誰しも広くシェアできるサービス。

## 本番URL

準備中

## バージョン

- ruby 2.6.5
- rails 6.0.2.1
- PostgreSQL 12.1

## 初期設定

以下のコマンドを実行して初期設定を行います。

```sh
# アプリ初期設定
docker-compose build
docker-compose run web bundle install --path vendor/bundle
docker-compose run web bundle exec yarn install

# データベース初期設定
docker-compose run web bundle exec rails db:create
docker-compose run web bundle exec rails db:migrate
docker-compose run web bundle exec rails db:seed
```

## 起動方法

以下のコマンドを実行してアプリケーションを起動します。

```sh
docker-compose up
```
