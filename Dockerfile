FROM ubuntu

RUN useradd -ms /bin/bash testuser && \
    echo "testuser:testuser" | chpasswd

RUN mkdir /opt/test
COPY . /opt/test

RUN apt update && apt install -y sudo

RUN echo "testuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /opt/test
USER testuser
#CMD [ "./install.sh" ]