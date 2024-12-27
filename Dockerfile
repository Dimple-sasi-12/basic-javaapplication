FROM amazonlinux
RUN yum install git -y 
WORKDIR dir
RUN git clone 'https://github.com/Dimple-sasi-12/basic-javaapplication.git'
COPY java-cicd/. /dir   
RUN yum install maven -y && yum install java-17 -y
RUN mvn clean install
WORKDIR app
COPY /dir/target/app-0.0.1-SNAPSHOT.war /app
ENTRYPOINT ["/app/java.sh"]
EXPOSE 8081
