FROM maven:3-jdk-8

#ARG KARATE_REPO=assessment-api/target/repository/com/intuit
#RUN mkdir -p ${KARATE_REPO}
#COPY C:\\Users\\Suresh\\.m2\\repository\\com\\intuit\\karate ${KARATE_REPO}
#RUN ls ${KARATE_REPO}


# create / copy the karate fatjar so that the docker image build can add it
#RUN mvn -f assessment-api/pom.xml package -P fatjar -DskipTests
#ARG KARATE_VERSION=1.1.0
#COPY assessment-api/target/karate-${KARATE_VERSION}.jar assessment-api/target/karate.jar

#CMD [ "java", "-jar", "karate.jar", "features/" ]

#RUN mkdir /assessment-api
#COPY target/karate.jar /assessment-api/
#CMD [ "java", "-jar", "karate.jar", "features/" ]

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY settings.xml /usr/share/maven/ref/
COPY pom.xml /tmp/pom.xml

COPY . /usr/src/app
COPY maven_runner.sh /
RUN chmod +x /maven_runner.sh

RUN mvn clean verify -Dtest=TestRunner
#RUN mvn clean verify -B -f /tmp/pom.xml -s /usr/share/maven/ref/settings-docker.xml -Dtest=TestRunner

#CMD ["/usr/src/app/maven_runner.sh"]
CMD ["/bin/bash", "/maven_runner.sh"]