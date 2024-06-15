FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-21-jdk -y

EXPOSE 25565
EXPOSE 8081
EXPOSE 443
EXPOSE 8443
EXPOSE 22

COPY . .
CMD ["ls"]
CMD ["java", "-Xms64M", "-Xmx300M", "-XX:+UseG1GC", "-XX:G1HeapRegionSize=4M", "-XX:+UnlockExperimentalVMOptions", "-XX:+ParallelRefProcEnabled", "-XX:+AlwaysPreTouch", "-XX:MaxInlineLevel=15", "-Dterminal.jline=false", "-Dterminal.ansi=true", "-jar", "waterfall-1.19-535.jar"]


