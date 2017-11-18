FROM alpine:3.5

RUN apk --no-cache add ncurses-libs bash

WORKDIR /opt/app/

EXPOSE 4000
ENV PORT=4000 MIX_ENV=prod REPLACE_OS_VARS=true SHELL=/bin/bash

ADD phx_bench_api.tar.gz ./

RUN adduser -S default
RUN chown -R default .
USER default

#ENTRYPOINT ["/opt/app/bin/phx_bench_api"]
CMD trap exit TERM; /opt/app/bin/phx_bench_api foreground & wait
