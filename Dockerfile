FROM curlimages/curl as builder

RUN curl -OL https://builds.clickhouse.com/master/aarch64v80compat/clickhouse

FROM ubuntu

WORKDIR /clickhouse
COPY --from=builder ./clickhouse ./

CMD [ "./clickhouse", "server" ]