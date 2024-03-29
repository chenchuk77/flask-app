FROM ubuntu:16.04
MAINTAINER Chen Alkabets "chenchuk@gmail.com"

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt
COPY . /app

#CMD [ "/bin/sleep", "10m" ]
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]
