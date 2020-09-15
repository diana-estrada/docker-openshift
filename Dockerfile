FROM openshift/jenkins-slave-maven-centos7:v3.11
USER root
#ARG OC_VERSION=2.2
#ARG BASE_URL=http://ftp.gnu.org/gnu/gnucobol/gnucobol-${OC_VERSION}.tar.gz
RUN yum -y install epel-release \
    && yum -y update \
    && yum -y install gcc gcc-c++ gmp-devel ncurses-libs ncurses-devel libdb-cxx-devel git libdb4 libicu glibc-devel
#ADD ${BASE_URL} oc.tar.gz
#RUN tar -xzvf oc.tar.gz &&\
#    cd gnucobol-$OC_VERSION &&\
#    ./configure --prefix=/usr--with-incompatible-bdb BDB_LIBS="-ldb-5.3"  &&\
#    make install &&\
#    ldconfig &&\
#    cd .. && rm oc.tar.gz && rm -rf gnucobol-$OC_VERSION
ADD http://packages.psychotic.ninja/7/base/x86_64/RPMS/open-cobol-1.1-5.el7.psychotic.x86_64.rpm /tmp/open-cobol-1.1-5.el7.psychotic.x86_64.rpm
ADD http://packages.psychotic.ninja/7/base/x86_64/RPMS/libcob-1.1-5.el7.psychotic.x86_64.rpm /tmp/libcob-1.1-5.el7.psychotic.x86_64.rpm
RUN yum -y install /tmp/libcob-1.1-5.el7.psychotic.x86_64.rpm tmp/open-cobol-1.1-5.el7.psychotic.x86_64.rpm