FROM alpine:3.9

RUN apk update && \
    apk upgrade && \
    apk add --no-cache git openssh zip

WORKDIR /git-backup
COPY . /git-backup
RUN chmod +x entrypoint.sh backup config.sh backup-all.sh

COPY ssh/ /root/.ssh/

ENTRYPOINT [ "./entrypoint.sh" ]
