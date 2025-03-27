FROM russtedrake/underactuated

ARG host_gid=999
ARG host_uid=1000
ARG user=malkstik

RUN groupadd -g $host_gid $user && \
    useradd -u $host_uid -g $host_gid -m $user
USER $user