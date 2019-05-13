FROM bash:latest

ENV EDITOR vi 
ENV PATH "$PATH:/source/"
ENV CALEPIN_PATH /data/notes/ 

RUN mkdir -p data/notes

ENTRYPOINT ["usr/local/bin/bash"]
