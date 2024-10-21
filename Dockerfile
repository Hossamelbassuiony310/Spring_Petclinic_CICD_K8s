FROM eclipse-temurin:21

RUN mkdir /app

COPY ./target/*.jar /app

WORKDIR /app

EXPOSE 8080

ENTRYPOINT ["java", "-jar","-Dspring.profiles.active=mysql" , "spring-petclinic-3.3.0-SNAPSHOT.jar"]

# spring-petclinic-3.3.0-SNAPSHOT.jar
