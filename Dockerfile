FROM registry.cn-hangzhou.aliyuncs.com/seawolflin/centos7-java11:1.0.0

COPY arthas /usr/local/bin/

ENV LC_ALL=zh_CN.UTF-8

RUN yum makecache \
    && yum -y install kde-l10n-Chinese glibc-common java \
    && localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 \
    && yum clean headers \
    && yum clean packages \
    && yum clean metadata \
    && mkdir -p /usr/local/java-lib &&  cd /usr/local/java-lib \
    && curl -O https://arthas.aliyun.com/arthas-boot.jar
