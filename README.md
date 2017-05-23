## k8s / openshift  simple custom  controller
```sh
cd $GOPATH
git clone https://github.com/debianmaster/k8s-custom-controller
cd k8s-custom-controller
go get k8s.io/client-go/kubernetes
go get k8s.io/apimachinery/pkg/apis/meta/v1
mkdir -p bin/linux
GOOS=linux GOARCH=amd64 go build -o bin/linux/custon-controller .
docker build -t "yournamespace/custom-controller" .
docker push yournamespace/custom-controller
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccounts:t1
oc new-app docker.io/yournamespace/custom-controller
```



