FROM curlimages/curl AS builder

WORKDIR /app
RUN curl -OL https://builds.clickhouse.com/master/aarch64v80compat/clickhouse

FROM ubuntu

WORKDIR /app
COPY --from=builder /app/clickhouse /app/clickhouse
RUN chmod +x ./clickhouse

CMD [ "./clickhouse", "server" ]