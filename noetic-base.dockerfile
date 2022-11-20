FROM nvidia/cudagl:11.4.2-devel-ubuntu20.04

ENV DISTRO_CODENAME focal
ENV ROSDISTRO noetic

RUN apt update 
RUN apt -y upgrade
RUN DEBIAN_FRONTEND=noninteractive TZ=America/Sao_Paulo apt -y install mesa-utils
RUN DEBIAN_FRONTEND=noninteractive TZ=America/Sao_Paulo apt -y install software-properties-common
RUN /bin/bash -c 'add-apt-repository ppa:kisak/kisak-mesa'
RUN apt-get -y update && apt -y dist-upgrade
RUN apt -y install curl gnupg2
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu ${DISTRO_CODENAME} main" > /etc/apt/sources.list.d/ros-${ROSDISTRO}.list'

RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
RUN apt update 

RUN DEBIAN_FRONTEND=noninteractive TZ=America/Sao_Paulo apt-get -y install ros-${ROSDISTRO}-desktop-full 
RUN DEBIAN_FRONTEND=noninteractive TZ=America/Sao_Paulo apt-get -y upgrade 

RUN apt-get -y install ros-$ROSDISTRO-depthimage-to-laserscan 
RUN apt-get -y install ros-$ROSDISTRO-slam-gmapping 
RUN apt-get -y install ros-$ROSDISTRO-rtabmap-ros 
RUN apt-get -y install ros-$ROSDISTRO-navigation 
RUN apt-get -y install ros-$ROSDISTRO-explore-lite 

RUN apt -y install git-all gedit
RUN apt -y install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

#######################################################################################################################

# RUN rosdep init
# RUN rosdep update

ENV DISPLAY=host.docker.internal:0.0

# # COPY ./scripts /tmp

# COPY /bootstrap.sh /

# #CMD /bin/bash -i -c

# RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
# RUN echo "source /root/catkin_ws/devel/setup.bash" >> ~/.bashrc

CMD /bin/bash

# CMD /bin/bash -c "/bootstrap.sh"

# # CMD /bin/bash -l -i -c "/tmp/configure_melodic.sh"