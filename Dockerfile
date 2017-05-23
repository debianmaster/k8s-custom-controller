FROM alpine
COPY bin/linux/custom-controller custom-controller
ENTRYPOINT ["/custom-controller"]
