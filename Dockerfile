FROM maven:3-jdk-8

VOLUME results:/testresults/cucumber-html-reports

RUN mkdir -p /api-assessment
WORKDIR /api-assessment

COPY . /api-assessment
RUN chmod +x /api-assessment/maven_runner.sh

RUN mvn prepare-package -DskipTests

CMD ["/bin/bash", "/api-assessment/maven_runner.sh"]