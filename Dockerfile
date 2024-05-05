FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-17-jdk -y

EXPOSE 25565
EXPOSE 8081
COPY . .
CMD ["ls"]
CMD ["java", "-jar", "bungeecord.jar"]
