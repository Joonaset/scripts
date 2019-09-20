#!/bin/bash

while [[ -z `ls | grep pom.xml` ]]
do
	cd ..
done

mvn compile $1
