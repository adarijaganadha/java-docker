FROM maven
WORKDIR /Java
RUN mvn clean package
FROM tomcat
WORKDIR /usr/local/tomcat/webapps/
COPY --from=build /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh","run"]
