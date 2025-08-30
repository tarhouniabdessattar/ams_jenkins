# Étape de construction avec Maven
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app

# Copier pom.xml et télécharger les dépendances (caching)
COPY pom.xml .
RUN mvn dependency:go-offline

# Copier le code source
COPY src ./src

# Construire l'application en ignorant les tests
RUN mvn clean package -DskipTests

# Étape finale avec OpenJDK
FROM openjdk:17-jdk-alpine
WORKDIR /app

# Copier le JAR depuis l'étape build
# Remplacer le nom du JAR selon ce qui est généré par Maven
COPY --from=build /app/target/ams_data-0.0.1-SNAPSHOT.jar ./app.jar

# Exposer le port de l'application
EXPOSE 8080

# Commande pour lancer l'application
CMD ["java", "-jar", "app.jar"]
