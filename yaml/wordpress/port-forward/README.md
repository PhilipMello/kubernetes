# Kubernetes Commands:

kubectl create secret generic mysecret --from-literal root_password=mypass --from-lit
eral user=wordpress --from-literal password=w0dpress --from-literal database=wordpress --from-literal host=mydb

kubectl apply -f mydb.yaml

kubectl set env deployment/mydb --from secret/mysecret --prefix=MYSQL_

kubectl apply -f myapp.yaml

kubectl set env deployment/wordpress --from secret/mysecret --prefix WORDPRESS_DB_

kubectl expose deployment mydb --port=3306 --target-port=3306 --protocol=TCP

kubectl expose deployment/wordpress --port=8080 --target-port=80 --protocol=TCP

kubectl port-forward svc/wordpress 8080:8080