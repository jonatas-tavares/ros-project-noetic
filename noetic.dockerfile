FROM nvidia/cudagl:11.4.2-devel-ubuntu20.04

ENV DISTRO_CODENAME focal
ENV ROSDISTRO noetic

RUN apt-get update
RUN apt update
RUN apt -y install curl gnupg2
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu ${DISTRO_CODENAME} main" > /etc/apt/sources.list.d/ros-${ROSDISTRO}.list'

RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
RUN apt-get update 

RUN DEBIAN_FRONTEND=noninteractive TZ=America/Sao_Paulo apt-get -y install ros-${ROSDISTRO}-desktop-full 
RUN DEBIAN_FRONTEND=noninteractive TZ=America/Sao_Paulo apt-get -y upgrade 

RUN apt-get -y install ros-$ROSDISTRO-depthimage-to-laserscan 
RUN apt-get -y install ros-$ROSDISTRO-slam-gmapping 
RUN apt-get -y install ros-$ROSDISTRO-rtabmap-ros 
RUN apt-get -y install ros-$ROSDISTRO-navigation 
RUN apt-get -y install ros-$ROSDISTRO-explore-lite 

RUN apt -y install git-all gedit

ENV DISPLAY=host.docker.internal:0.0

COPY ./scripts /tmp

COPY /bootstrap.sh /

#CMD /bin/bash -i -c

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
RUN echo "source /root/catkin_ws/devel/setup.bash" >> ~/.bashrc

CMD /bin/bash -c "/bootstrap.sh"

# CMD /bin/bash -l -i -c "/tmp/configure_melodic.sh"