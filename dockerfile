FROM ubuntu:16.04
RUN useradd -ms /bin/bash user
USER user
WORKDIR /home/user

FROM python:3.5
RUN pip install --upgrade pip
RUN apt-get update 
RUN apt-get install ffmpeg libsm6 libxext6  -y


COPY requirements.txt .
RUN pip install -r requirements.txt && rm requirements.txt


COPY . .

EXPOSE 10000

ENTRYPOINT [ "python", "run_single.py" ]