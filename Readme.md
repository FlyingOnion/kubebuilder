# imagefc/kubebuilder
太长不看：

```bash
docker run -it -v ${PWD}:/go/src:rw --rm imagefc/kubebuilder:v3.9.1 bash

# In container
root@47016e93431d:/go/src# mkdir foo
root@47016e93431d:/go/src# cd foo

# If you are in gopath then just run go mod init
root@47016e93431d:/go/src/foo# go mod init
root@47016e93431d:/go/src/foo# kubebuilder init
## Lots of output
root@47016e93431d:/go/src/foo# kubebuilder create api --group foo --version v1 --kind Foo
Create Resource [y/n]
y
Create Controller [y/n]
y
## Lots of output

root@47016e93431d:/go/src/foo# exit
```

## 仓库地址
https://github.com/imagefc/kubebuilder

## 可用版本

- `v3.9.1`, `latest`

## 开源协议及补充说明

本项目代码使用木兰宽松许可证（Mulan PSL v2）授权。补充说明如下：

```
[Year]="2022"
[name of copyright holder]="ImageFC Team"
[Software Name]="github.com/imagefc/kubebuilder"
```

您对本项目的复制、使用、修改、分发也被视为同意以下条款：

1. 项目中的任何文件都使用木兰宽松许可证授权，即使文件中不包含 COPYRIGHT 信息也一样。
2. 本项目作者和授权方对您对此项目原代码的滥用行为不负任何责任。如果您将本项目用于某种非法或违规行为，所有的后果由您独自承担。
3. 本项目作者对本项目拥有最终解释权。

