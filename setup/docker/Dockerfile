# -*- mode: dockerfile -*-
# vi: set ft=dockerfile :

# Copyright 2021 Massachusetts Institute of Technology.
# Licensed under the BSD 3-Clause License. See LICENSE.TXT for details.

# cd $(git rev-parse --show-toplevel)
# docker build -f setup/docker/Dockerfile \
#   -t russtedrake/underactuated:latest .
#
# docker run -i -p 7000:7000 -p 8888:8888 -t -v $(pwd):/root/underactuated \
#   -w /root/underactuated russtedrake/underactuated:latest
#
# docker login
# docker push russtedrake/underactuated:latest

FROM robotlocomotion/drake:jammy
ARG DEBIAN_FRONTEND=noninteractive
ENV SHELL /bin/bash
# Open ports for meshcat:
EXPOSE 7000-7099/tcp
EXPOSE 8888/tcp
LABEL org.opencontainers.image.authors="Russ Tedrake"
LABEL org.opencontainers.image.description="Algorithms for walking, running, swimming, flying, and underactuated"
LABEL org.opencontainers.image.licenses="BSD-3-Clause"
LABEL org.opencontainers.image.source="https://github.com/RussTedrake/underactuated.git"
LABEL org.opencontainers.image.title="Underactuated Robotics"
LABEL org.opencontainers.image.url="https://underactuated.csail.mit.edu/"
LABEL org.opencontainers.image.vendor="Massachusetts Institute of Technology"
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
COPY requirements.txt /tmp/requirements.txt
COPY setup/docker/pip.conf /root/.config/pip/pip.conf
COPY setup/ubuntu/22.04/install_prereqs.sh /tmp/
RUN /tmp/install_prereqs.sh
RUN apt-get -q update && apt-get -q install -y --no-install-recommends \
    curl git nginx-light python-is-python3 python3-pip python3-venv xvfb \
    && apt-get remove -y python3-notebook && apt-get autoremove -y && apt-get -q clean
# We still pip install the requirements, because otherwise deepnote will
# install old versions of e.g. scipy which cannot be upgraded in the
# Init notebook.  Drake is also installed in /opt/drake, but is not used (since 
# I've not added it to the path / pythonpath).
RUN pip3 install -r /tmp/requirements.txt pyvirtualdisplay underactuated
RUN rm -rf /root/.cache /root/.config
RUN rm -f /tmp/install_prereqs.sh
RUN rm -f /tmp/requirements.txt
RUN rm -f /var/cache/debconf/*-old
RUN rm -rf /var/lib/apt/lists/*
RUN rm -f /var/log/*.log
RUN rm -f /var/log/apt/*
