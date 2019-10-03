FROM fpco/stack-build:lts-14.6 as builder

RUN set -e \
  && cd /usr/lib/gcc/x86_64-linux-gnu/7.4.0 \ 
  && cp crtbeginT.o crtbeginT.o.orig \
  && cp crtbeginS.o crtbeginT.o

ADD . /work
WORKDIR /work 

RUN set -e \
  && stack setup \
  && stack --system-ghc build \
    --ghc-options='-fPIC -optl-static -optl-pthread -optc-Os' \
  && stack --local-bin-path /sbin install

FROM alpine

COPY --from=builder /sbin/haskell-cloudrun-helloworld-exe /helloworld

CMD ["/helloworld"]
