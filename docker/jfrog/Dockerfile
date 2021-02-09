FROM docker.bintray.io/jfrog/artifactory-oss:6.6.3

COPY bootstrap.creds /var/opt/jfrog/artifactory/access/etc/bootstrap.creds

ENV EXTRA_JAVA_OPTIONS="-Xms512m -Xmx2g"

EXPOSE 8081
