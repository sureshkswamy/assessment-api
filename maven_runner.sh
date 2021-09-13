#!/bin/bash
echo "START: Running tests..."
mvn clean verify -Dtest=TestRunner
cp -r /api-assessment/target/cucumber-html-reports/ /testresults/cucumber-html-reports