FROM centos:7
#FROM scratch
COPY listdir /listdir
CMD ["ls /"]
#CMD ["/listdir]
