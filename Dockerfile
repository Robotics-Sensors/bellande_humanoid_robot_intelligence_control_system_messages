FROM ubuntu:20.04 as base_build
ENV DEBIAN_FRONTEND noninteractive
ENV PYTHON_VERSION="3.8"
ARG BASE_IMAGE=nvcr.io/nvidia/l4t-base:r32.5.0

ARG ROS_ENVIROMENT_VERSION_GIT_BRANCH=master
ARG ROS_ENVIROMENT_VERSION_GIT_COMMIT=HEAD

LABEL maintainer=ronaldsonbellande@gmail.com
LABEL ros_enviroment_github_branchtag=${ROS_ENVIROMENT_VERSION_GIT_BRANCH}
LABEL ros_enviroment_github_commit=${ROS_ENVIROMENT_VERSION_GIT_COMMIT}

# Ubuntu setup
RUN apt-get update -y
RUN apt-get upgrade -y

# RUN workspace and sourcing
WORKDIR ./
COPY requirements.txt .

ARG ROS_PKG=ros_base
ENV ROS_DISTRO=noetic
ENV ROS_ROOT=/opt/ros/${ROS_DISTRO}
ENV DEBIAN_FRONTEND=noninteractive

# add the ROS deb repo to the apt sources list
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
		cmake \
		build-essential \
		curl \
		wget \
		gnupg2 \
		lsb-release \
		ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -


# install bootstrap dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
          libpython3-dev \
          python3-rosdep \
          python3-rosinstall-generator \
          python3-vcstool \
          build-essential && \
    rosdep init && \
    rosdep update && \
    rm -rf /var/lib/apt/lists/*


# download/build the ROS source
RUN mkdir ros_catkin_ws && \
    cd ros_catkin_ws && \
    rosinstall_generator ${ROS_PKG} vision_msgs --rosdistro ${ROS_DISTRO} --deps --tar > ${ROS_DISTRO}-${ROS_PKG}.rosinstall && \
    mkdir src && \
    vcs import --input ${ROS_DISTRO}-${ROS_PKG}.rosinstall ./src && \
    apt-get update && \
    rosdep install --from-paths ./src --ignore-packages-from-source --rosdistro ${ROS_DISTRO} --skip-keys python3-pykdl -y && \
    python3 ./src/catkin/bin/catkin_make_isolated --install --install-space ${ROS_ROOT} -DCMAKE_BUILD_TYPE=Release && \
    rm -rf /var/lib/apt/lists/*


 # Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        apt-utils \
        automake \
        build-essential \
        ca-certificates \
        curl \
        git \
        python3-pip \
        libcurl3-dev \
        libfreetype6-dev \
        libpng-dev \
        libtool \
        libzmq3-dev \
        mlocate \
        openjdk-8-jdk\
        openjdk-8-jre-headless \
        pkg-config \
        python-dev \
        software-properties-common \
        swig \
        unzip \
        wget \
        zip \
        zlib1g-dev \
        python3-distutils \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# Install python 3.8 and make primary 
RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && apt-get install -y \
    python3.8 python3.8-dev python3-pip python3.8-venv && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1

# pip install 
RUN pip3 install --upgrade pip

RUN curl -fSsL -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py


# Install python libraries
RUN pip --no-cache-dir install -r requirements.txt
