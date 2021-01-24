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
# TODO: Copy over config.sh and run with wait-for-it
RUN aptitude -y install curl wait-for-it
RUN wait-for-it localhost:8080 -- echo 'Geoserver is running' >> testing.txt

# Expose the Geoserver port
EXPOSE 8080

# Run Geoserver
CMD ["sh", "bin/startup.sh"]