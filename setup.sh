minikube start
eval $(minikube docker-env)
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

docker build -t nginx ./srcs/nginx
docker build -t phpmyadmin ./srcs/phpmyadmin
docker build -t wordpress ./srcs/wordpress

kubectl apply -f ./srcs/yaml_files/metallb.yaml  
kubectl apply -f ./srcs/yaml_files/nginx_conf.yaml
