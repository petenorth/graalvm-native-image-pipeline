#FROM centos:7
FROM scratch
COPY listdir /listdir
#RUN ls -l /

#USER 1001

#CMD ["ls"]
CMD ["/listdir"]
