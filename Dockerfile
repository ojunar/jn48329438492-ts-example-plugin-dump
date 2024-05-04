FROM adoptopenjdk/openjdk11:latest
EXPOSE 25577
EXPOSE 8081
CMD ["java", "-jar", "bungeecord.jar"]
