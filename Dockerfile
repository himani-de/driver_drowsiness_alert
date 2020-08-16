FROM python:3.7.7
MAINTAINER himani "himani.de7@gmail.com"
RUN mkdir /workspace
WORKDIR /workspace
COPY requirement.txt /workspace
RUN pip install -r requirement.txt
COPY driver_drowsiness_alert.ipynb /workspace
COPY shape_predictor_68_face_landmarks.dat /workspace
CMD python driver_drowsiness_alert.ipynb

