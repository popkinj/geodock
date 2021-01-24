FROM ubuntu:20.04

# Geoserver version
ARG GV=2.18.2

# Set the time zone
ARG TZ=America/Vancouver
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install a smarter package manager
RUN apt-get update 
RUN apt-get -y install aptitude

# Download Geoserver
RUN mkdir /usr/share/geoserver
WORKDIR /usr/share/geoserver
RUN aptitude -y install wget
RUN wget https://sourceforge.net/projects/geoserver/files/GeoServer/$GV/geoserver-$GV-bin.zip/download

# Install Geoserver
RUN aptitude -y install openjdk-8-jdk
RUN aptitude -y install unzip
RUN unzip download
RUN rm download

# This is for configuring Geoserver
COPY config.sh ./
RUN aptitude -y install curl wait-for-it

# Expose the Geoserver port
EXPOSE 8080

# Run and configure Geoserver
ENTRYPOINT wait-for-it localhost:8080 -- bash config.sh & sh bin/startup.sh 
