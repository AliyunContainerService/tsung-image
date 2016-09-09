# tsung-image
<a href="https://cs.console.aliyun.com/#/app/create/step1" target="_blank"><img src="http://moyuan.oss-cn-beijing.aliyuncs.com/github/icon.png"  width=108px/></a>    

## Info  
Use Tsung to do Load Tests.   

## Usage
### Single Mode  

```
tsung-single:
    image: "registry.cn-hangzhou.aliyuncs.com/ringtail/tsung:v1.0"
    volumes:
        - '/root/sample.xml:/root/.tsung/tsung.xml'
        - '/var/lib/docker/tsung:/root/.tsung/log'
    labels:
        aliyun.routing.port_8091: tsung
    command: single
```
### Cluster Mode

```
tsung-master:
    image: "registry.cn-hangzhou.aliyuncs.com/ringtail/tsung:v1.0"
    volumes:
        - '/mnt/acs_mnt/ossfs/cs-volume/sample.xml:/root/.tsung/tsung.xml'
        - '/var/lib/docker/tsung:/root/.tsung/log'
        - '/mnt/acs_mnt/ossfs/cs-volume/id_rsa:/root/.ssh/id_rsa'
    environment:
        - DISABLE_HOST_CHECK= true   #免用户输入yes
    labels:
        aliyun.routing.port_8091: tsung
    command: "master"
    links:
        - "tsung-slave:tsung-slave"  #可不适用link，直接使用hostname
tsung-slave:
    image: "registry.cn-hangzhou.aliyuncs.com/ringtail/tsung:v1.0"
    command: "slave"
    environment:
        - AUTHORIZED_KEYS=<公钥内容> #cat ~/.ssh/id_rsa.pub
```

## linked repo  
<a href="https://github.com/ringtail/docker-ssh-authorized-keys" target="_blank">docker-ssh-authorized-keys</a>
