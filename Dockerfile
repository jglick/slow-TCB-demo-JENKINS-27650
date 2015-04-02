FROM jenkins:1.580.2
COPY plugins.txt /
RUN /usr/local/bin/plugins.sh /plugins.txt
COPY JENKINS_HOME /usr/share/jenkins/ref
# /usr/share/jenkins/ref is unfortunately owned by root:
USER root
RUN cd /usr/share/jenkins/ref/jobs && mkdir unused/jobs && bash -c 'for i in {00..99}; do mkdir unused/jobs/project$i; cp runme/config.xml unused/jobs/project$i/config.xml; done'
USER jenkins
