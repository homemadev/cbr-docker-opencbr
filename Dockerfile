FROM java:openjdk-7-jre
#ubuntu:14.04
#java:openjdk-7-jre

ENV OPENMRS_HOME=/usr/share/openmrs
ENV OPENMRS_HOME $OPENMRS_HOME

#RUN apt-get update
#RUN apt-get -yq install wget
#RUN apt-get -yq install unzip
#RUN apt-get -yq install openjdk-7-jre
RUN mkdir $OPENMRS_HOME
#RUN wget --progress=bar:force https://sourceforge.net/projects/openmrs/files/releases/OpenMRS_2.4/openmrs-standalone-2.4.zip/download -O /tmp/openmrs.zip
COPY openmrs-standalone-2.4.zip /tmp/openmrs.zip
COPY init.sh $OPENMRS_HOME/init.sh
RUN cd /tmp && unzip -q openmrs.zip
RUN cp -r /tmp/openmrs-standalone-1.11.6/* $OPENMRS_HOME
RUN adduser --disabled-password --ingroup sudo openmrs
EXPOSE 8081
RUN chown openmrs -R $OPENMRS_HOME
WORKDIR $OPENMRS_HOME
RUN chmod +x init.sh
CMD $OPENMRS_HOME/init.sh run