FROM golang:1.20-rc

ARG version

RUN go env -w GOPROXY="https://goproxy.cn,direct"
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

RUN git clone --depth 1 --branch ${version} https://github.com/kubernetes-sigs/kubebuilder ${GOPATH}/src/kubebuilder
WORKDIR ${GOPATH}/src/kubebuilder

RUN git checkout -b ${version} || git checkout ${version}
RUN sed -i 's#https://proxy.golang.org/#https://goproxy.cn,direct#g' Makefile
RUN make build && make install

WORKDIR ${GOPATH}
RUN rm -rf ${GOPATH}/src/kubebuilder

COPY entrypoint.sh /docker-entrypoint.sh
RUN chmod 755 /docker-entrypoint.sh

VOLUME [ "${GOPATH}" ]

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "kubebuilder" ]