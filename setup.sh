minikube start
eval $(minikube docker-env)
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

docker build -t nginx ./srcs/nginx
docker build -t mysql ./srcs/MySQL
docker build -t phpmyadmin ./srcs/phpmyadmin
docker build -t wordpress ./srcs/wordpress
docker build -t ftps ./srcs/FTPS
docker build -t grafana ./srcs/Grafana
docker build -t influxdb ./srcs/InfluxDB

kubectl apply -f ./srcs/yaml_files/metallb.yaml
kubectl apply -f ./srcs/yaml_files/nginx_conf.yaml
kubectl apply -f ./srcs/yaml_files/mysql_conf.yaml
kubectl apply -f ./srcs/yaml_files/phpmyadmin_conf.yaml
kubectl apply -f ./srcs/yaml_files/wordpress_conf.yaml
kubectl apply -f ./srcs/yaml_files/ftps_conf.yaml
kubectl apply -f ./srcs/yaml_files/grafana_conf.yaml
kubectl apply -f ./srcs/yaml_files/influxdb_conf.yaml

minikube dashboard