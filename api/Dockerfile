FROM python:3
MAINTAINER vinod kumar
WORKDIR /
COPY ./requirements.txt .
RUN pip install -r requirements.txt
COPY . /
CMD [ "python","/app.py" ]

