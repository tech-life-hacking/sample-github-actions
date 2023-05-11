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
    mkdir -p dlib && \
    git clone -b 'v19.9' --single-branch https://github.com/davisking/dlib.git dlib/ && \
    cd  dlib/ && \
    python3 setup.py install --compiler-flags "-mfpu=neon"

RUN pip3 install opencv-python
RUN pip3 install face_recognition
RUN git clone https://github.com/ageitgey/face_recognition.git
RUN cd face_recognition/examples && \
    python3 face_distance.py
