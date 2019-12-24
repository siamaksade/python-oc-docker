FROM centos:8

ARG OC_VERSION=4.2.12

RUN yum update -y && \
    yum -y install yum-utils && \
    yum -y install python3 && \
    pip3 install requests && \
    yum clean all

RUN curl -L -o /tmp/oc.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux-${OC_VERSION}.tar.gz && \
    tar xvfz /tmp/oc.tar.gz && \
    mv oc /usr/local/bin && \
    mv kubectl /usr/local/bin