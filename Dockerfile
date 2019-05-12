FROM bash:latest

ENV EDITOR vi 
ENV PATH "$PATH:/source/"
ENV NOTES_PATH /data/notes/ 

RUN mkdir -p data/notes

ENTRYPOINT ["usr/local/bin/bash"]
