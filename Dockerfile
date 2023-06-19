FROM ruby:3.0.1

# 起動させるためのパッケージを取得
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    # `build-essential`は開発に必須のビルドツールを提供しているパッケージ
    build-essential \
    postgresql-client \
    nodejs \
    vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
    RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && apt-get install -y nodejs
RUN npm install --global yarn

# 作業用のディレクトリを作成(存在しない場合は勝手に作成してくれる)
WORKDIR /api

#既存railsプロジェクトをコンテナ内にコピー
COPY . /api

# ホストのGemfileとGemfile.lockをコンテナにコピー
COPY Gemfile Gemfile.lock ./

# ホストのGemfile達をコンテナ内にコピー
# COPY Gemfile /api/Gemfile
# COPY Gemfile.lock /api/Gemfile.lock

# Gemのインストール
RUN gem install bundler
RUN bundle config set force_ruby_platform true
RUN bundle install -j4 --retry 3

# # Railsアプリケーションのコードをコンテナにコピー
# COPY . .



COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# データベースのセットアップ
# RUN rails db:create db:migrate db:seed

# `EXPOSE <ポート>`はコンテナ実行時に<ポート>にリッスンするよう命令するコマンド。
EXPOSE 3010
# CMD bundle exec puma -C config/puma.rb
CMD ["rails", "server", "-b", "0.0.0.0"]

# データベースのセットアップ
# RUN rails db:create db:migrate db:seed