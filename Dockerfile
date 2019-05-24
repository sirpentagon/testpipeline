FROM anooptcs/tomcat8-jdk8
# Take the war and copy to webapps of tomcat
COPY target/*.war /usr/local/tomcat/webapps/
#RUN apk add --no-cache ca-certificates && update-ca-certificates
ADD https://get.aquasec.com/microscanner .
RUN chmod +x microscanner
#RUN ./microscanner ZTQ5NzIxMWNmY2U0
