FROM techlife/raspios_lite_armhf:2022-09-06_bullseye

RUN apt update && \
    apt upgrade -y
RUN apt install -y build-essential \
    cmake \
    gfortran \
    git \
    wget \
    curl \
    graphicsmagick \
    libgraphicsmagick1-dev \
    libatlas-base-dev \
    libavcodec-dev \
    libavformat-dev \
    libboost-all-dev \
    libgtk2.0-dev \
    libjpeg-dev \
    liblapack-dev \
    libswscale-dev \
    pkg-config \
    python3-dev \
    python3-numpy \
    python3-pip \
    zip
RUN apt clean
RUN cd ~ && \
    git clone https://github.com/tech-life-hacking/sample-github-actions.git && \
    cd sample-github-actions && \
    pip3 install dlib-19.9.0-cp39-cp39-linux_armv7l.whl

RUN cd ~ && \
    git clone https://github.com/tech-life-hacking/opencv_python_wheels.git && \
    cd opencv_python_wheels && \
    pip3 install opencv_python-4.7.0.72-cp39-cp39-linux_armv7l.whl

RUN pip3 install face_recognition

RUN cd ~ && \
    git clone https://github.com/ageitgey/face_recognition.git && \
    cd face_recognition/examples && \
    python3 face_distance.py
