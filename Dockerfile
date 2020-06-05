FROM kmccanless/aws-sam-ruby-2-7:1.8
LABEL maintainer="Keith McCanless"
#Debugging sam build showed failing because of not finding this flag so setting
ENV SAM_CLI_TELEMETRY 0
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
