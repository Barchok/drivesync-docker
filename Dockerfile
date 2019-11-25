FROM ruby:2.5-alpine

RUN apk add --no-cache shadow && \
    mkdir -p /app/home/Documents /appdata &&\
    ln -s /sync /app/home/Documents/drive && \
    ln -s /appdata/credentials/ /app/home/.credentials && \
    ln -s /appdata/config/ /app/home/.drivesync && \
    addgroup -S aaa && \
    adduser -S -h /app/home -G aaa aaa  && \
	cd /app && \
	wget -q https://github.com/MStadlmeier/drivesync/archive/master.zip && \
    unzip master.zip && \ 
    rm  master.zip && \
    cd drivesync-master &&\
	bundle install

ADD runner.sh /app

CMD ["sh", "/app/runner.sh"]

