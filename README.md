> This is based on official example https://github.com/kubernetes/kubernetes/tree/master/staging/src/k8s.io/client-go/examples/in-cluster  but i'm listing down the steps here to make it easy for beginners.


## k8s / openshift  simple custom  controller
```sh
cd $GOPATH
git clone https://github.com/debianmaster/k8s-custom-controller
cd k8s-custom-controller
go get k8s.io/client-go/kubernetes
go get k8s.io/apimachinery/pkg/apis/meta/v1
mkdir -p bin/linux
GOOS=linux GOARCH=amd64 go build -o bin/linux/custom-controller .
docker build -t "yournamespace/custom-controller" .
docker push yournamespace/custom-controller
```

### Running in openshift
```sh
oc new-project test1
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccounts:test1
oc new-app docker.io/yournamespace/custom-controller
```

### Running in kubernetes
```sh
kubectl create namespace t2
kubectl run --image=docker.io/yournamespace/custom-controller custom-controller
```
>  look at controller log



