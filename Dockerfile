FROM kmccanless/aws-sam-ruby-2-7:1.1
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
