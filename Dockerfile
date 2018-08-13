FROM scratch
RUN ls /app/
COPY /app/listdir /app

CMD ["/app"]
