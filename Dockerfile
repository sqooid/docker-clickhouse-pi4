FROM curlimages/curl AS builder

RUN curl -OL https://builds.clickhouse.com/master/aarch64v80compat/clickhouse

FROM ubuntu

WORKDIR /app
COPY --from=builder ./clickhouse /app/clickhouse
RUN chmod +x ./clickhouse

CMD [ "./clickhouse", "server" ]