FROM openjdk:8

RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/* 

ARG KARATE_VERSION=1.1.0

VOLUME /karate/testFeatures
VOLUME /karate/target

WORKDIR /src

RUN wget "https://dl.bintray.com/ptrthomas/karate/karate-${KARATE_VERSION}.jar" -O karate.jar

CMD [ "java", "-jar", "karate.jar", "testFeatures/" ]