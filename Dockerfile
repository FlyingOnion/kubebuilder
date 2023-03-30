FROM golang:1.20-rc-alpine

ARG KUBEBUILDER_VERSION=v3.9.1

RUN go env -w GOPROXY="https://goproxy.cn,direct"
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN git clone --depth 1 --branch ${KUBEBUILDER_VERSION} https://github.com/kubernetes-sigs/kubebuilder
WORKDIR ${GOPATH}/kubebuilder

RUN git checkout -b ${KUBEBUILDER_VERSION} || git checkout ${KUBEBUILDER_VERSION}
RUN sed -i 's#https://proxy.golang.org/#https://goproxy.cn,direct#g' Makefile
RUN make build && make install

WORKDIR ${GOPATH}
RUN rm -rf ${GOPATH}/kubebuilder

COPY entrypoint.sh /docker-entrypoint.sh
RUN chmod 755 /docker-entrypoint.sh

VOLUME [ "${GOPATH}" ]

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "kubebuilder" ]