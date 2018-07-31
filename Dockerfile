FROM tomcat:8.5.32-jre8-slim
LABEL contributor=M.Manna
WORKDIR $CATALINA_HOME
COPY ["welcome.jsp","webapps/ROOT/"]
CMD ["catalina.sh","run"]
