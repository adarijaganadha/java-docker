FROM maven as build
WORKDIR /Java
COPY . .
RUN mvn clean package
FROM tomcat
WORKDIR /usr/local/tomcat/webapps/
COPY --from build /Java/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh","run"]
