FROM alpine AS builder
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add --no-cache build-base
WORKDIR /workspace
ADD . .
RUN make

FROM scratch
COPY --from=builder /workspace/pause /
CMD ["/pause"]
