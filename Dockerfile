#Dockerfile

FROM centos

RUN yum -y install java wget
RUN java -version
RUN mkdir /opt/tomcat
RUN mkdir /opt/eks-deploy
COPY *.yml /opt/eks-deploy/
RUN wget https://downloads.apache.org/tomcat/tomcat-8/v8.5.72/bin/apache-tomcat-8.5.72.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -rv /tmp/apache-tomcat-8.5.72/* /opt/tomcat/
RUN ls ${WORKSPACE}
RUN ls /opt/tomcat/
# COPY gameoflife-web/target/*.war /opt/tomcat/webapps
RUN ls /opt/tomcat/bin
EXPOSE 8080
CMD /opt/tomcat/bin/catalina.sh run
