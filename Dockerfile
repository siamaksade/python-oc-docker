FROM quay.io/centos/centos:stream9

ARG OC_VERSION=4.17.12

RUN yum update -y && \
    yum -y install yum-utils && \
    yum -y install python3 python3-pip && \
    pip3 install requests && \
    yum clean all

RUN curl -L -o /tmp/oc.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux-amd64-rhel9-${OC_VERSION}.tar.gz && \
    tar xvfz /tmp/oc.tar.gz && \
    mv oc /usr/local/bin && \
    mv kubectl /usr/local/bin
