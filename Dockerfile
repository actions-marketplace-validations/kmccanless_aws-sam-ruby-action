FROM kmccanless/aws-sam-ruby-2-7:latest
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
