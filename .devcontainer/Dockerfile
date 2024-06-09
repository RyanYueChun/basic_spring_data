FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

# Set the environment variables
ENV DEBIAN_FRONTEND=noninteractive
ARG DOCKERVERSION=26.1.3
ARG JAVA_MAJOR_VERSION=21
ARG JAVA_MINOR_VERSION=0.3
ARG JAVA_BUILD_VERSION=9
ARG MAVEN_VERSION=3.9.7
ARG JDK_TAR=OpenJDK${JAVA_MAJOR_VERSION}U-jdk_x64_linux_hotspot_${JAVA_MAJOR_VERSION}.${JAVA_MINOR_VERSION}_${JAVA_BUILD_VERSION}.tar.gz

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    curl && \
    rm -rf /var/lib/apt/lists/*

# Download Java
RUN curl -L -O https://github.com/adoptium/temurin${JAVA_MAJOR_VERSION}-binaries/releases/download/jdk-${JAVA_MAJOR_VERSION}.${JAVA_MINOR_VERSION}%2B${JAVA_BUILD_VERSION}/OpenJDK${JAVA_MAJOR_VERSION}U-jdk_x64_linux_hotspot_${JAVA_MAJOR_VERSION}.${JAVA_MINOR_VERSION}_${JAVA_BUILD_VERSION}.tar.gz 
RUN tar xvf ${JDK_TAR} -C /opt 
RUN mv /opt/jdk* /opt/java
RUN rm ${JDK_TAR}
RUN update-alternatives --install /usr/bin/java java /opt/java/bin/java 100
RUN update-alternatives --install /usr/bin/javac javac /opt/java/bin/javac 100

ENV JAVA_HOME /opt/java

# install Maven
RUN curl -O https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz
RUN tar xzvf apache-maven-${MAVEN_VERSION}-bin.tar.gz
RUN rm apache-maven-${MAVEN_VERSION}-bin.tar.gz

RUN mv apache-maven-${MAVEN_VERSION}/ /usr/local/
RUN ln -s /usr/local/apache-maven-${MAVEN_VERSION}/ /usr/local/maven

ENV M2_HOME=/usr/local/maven
ENV PATH=$M2_HOME/bin:$PATH