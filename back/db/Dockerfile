#使うDockerイメージ
FROM mysql:8.0.23

#MySQL設定ファイルをイメージ内にコピー
COPY docker-entrypoint.sh /tmp
ENTRYPOINT ["/tmp/docker-entrypoint.sh"]
CMD [ "/sbin/init" ]

RUN ["--default-authentication-plugin=mysql_native_password"]

RUN ["--innodb-use-native-aio=0"]