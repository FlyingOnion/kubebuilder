FROM golang:1.20

ARG KUBEBUILDER_VERSION v3.9.1

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

RUN git clone --depth 1 --branch ${KUBEBUILDER_VERSION} https://github.com/kubernetes-sigs/kubebuilder
# COPY . /go/src/kubebuilder/
WORKDIR ${GOPATH}/kubebuilder

RUN git checkout -b ${KUBEBUILDER_VERSION}
RUN go env -w GOPROXY="https://goproxy.cn,direct"
RUN sed -i 's#https://proxy.golang.org/#https://goproxy.cn,direct#g' Makefile
RUN make build && make install

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "entrypoint.sh" ]
CMD [ "kubebuilder" ]