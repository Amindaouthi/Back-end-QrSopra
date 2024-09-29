# Utilisez une image de base Java
FROM openjdk:17-jdk
# Définissez le répertoire de travail dans le conteneur
WORKDIR /daouthiamine/sopra

# Copiez le fichier JAR de votre application dans le conteneur
COPY target/spring-boot-security-postgresql-1.0.0.jar spring-boot-security-postgresql-1.0.0.jar

# Exposez le port sur lequel votre application Spring Boot écoute
EXPOSE 8082

# Commande pour exécuter votre application Spring Boot
CMD ["java", "-jar", "spring-boot-security-postgresql-1.0.0.jar"]
