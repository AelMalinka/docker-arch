FROM base/archlinux
LABEL maintainer="Michael Thomas (malinka) <aelmalinka@gmail.com>"

ENV TINI_VERSION=v0.16.1

COPY . /etc
RUN locale-gen

RUN yes | pacman -Syu

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /sbin/init
RUN chmod +x /sbin/init

ENTRYPOINT ["/sbin/init", "--"]
