FROM ruby:3.4.6

# 必要なパッケージのインストール
# RUN apt-get update && apt-get install -y \
#     nodejs \
#     yarn

RUN apt-get update -qq && apt-get install -y \ 
    nodejs default-mysql-client

# 作業ディレクトリの設定
RUN mkdir -p /poke_app/backend
WORKDIR /poke_app/backend

# GemfileとGemfile.lockをコピーして依存関係をインストール
COPY Gemfile Gemfile.lock /poke_app/backend/
RUN gem install bundler
RUN bundle install

# アプリケーションのファイルをコピー
COPY . /poke_app/backend

# entrypoint.shのコピーと実行権限の付与
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# エントリーポイントの設定
ENTRYPOINT ["entrypoint.sh"]

# ポートのエクスポート
EXPOSE 3000

# Railsサーバーの起動コマンド
CMD ["rails", "server", "-b", "0.0.0.0"]