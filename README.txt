2207242231 fkam
- modified flow to use gcr.io 
- corrected oath permission in gke.tf to use gcr.io project repository image
- added app github at https://github.com/fkam18/nodejsapp.git
- added cicd-selfhost for script based jenkin like cicd pipeline
	- just add a hook to call cicd-selfhost/makeit when there's a commit
	- will auto update docker image and force cluster to reload updated image
2207222135 fkam
- added deploy-tf 
	- using terraform to specify the deployment 

2207201458 fkam
- folder application
	- created docker image as fkam18/nodejsapp:1.0
- folder tf3 -> create cluster 
	- git clone and modified from: https://learn.hashicorp.com/terraform/kubernetes/provision-gke-cluster
	- vpc is modularised in modules/vpc
gcloud container clusters list
	- hw1proj-356816-gke  europe-west4  1.22.8-gke.202  35.204.215.160  n1-standard-1  1.22.8-gke.202  9          RUNNING
- folder deploy
	- makeit 
		- obtain credentials for kubectl to the cluster
		- deploy2.yaml deploys a replicatset of fkam18/nodejsapp:1.0
		- balance1.yaml deploys a loadbalancer with ext IP
fkam@fkam-ThinkPad-W540:~/projects/hw1/deploy$ kubectl get pods
NAME              READY   STATUS    RESTARTS   AGE
nodejsapp-5c9rk   1/1     Running   0          2m13s
nodejsapp-77pdc   1/1     Running   0          2m13s
nodejsapp-s8dnh   1/1     Running   0          2m13s
fkam@fkam-ThinkPad-W540:~/projects/hw1/deploy$ 
fkam@fkam-ThinkPad-W540:~/projects/hw1/deploy$ kubectl get services
NAME         TYPE           CLUSTER-IP    EXTERNAL-IP   PORT(S)        AGE
kubernetes   ClusterIP      10.248.0.1    <none>        443/TCP        40m
nodejsapp    LoadBalancer   10.248.5.45   34.91.28.61   80:30053/TCP   89s

- folder gke-prometheus
	- cloned from:
		- https://www.unixarena.com/2021/07/gke-install-and-configure-prometheus-kubernetes.html/
	- auto detect pods with /metrics end points
fkam@fkam-ThinkPad-W540:~/projects/hw1/gke-prometheus$ kubectl get pods --namespace=monitor-prometheus
NAME                                    READY   STATUS    RESTARTS   AGE
prometheus-deployment-87cc8fb88-4jl7d   1/1     Running   0          11s
fkam@fkam-ThinkPad-W540:~/projects/hw1/gke-prometheus$ kubectl get svc --namespace=monitor-prometheus
NAME                 TYPE           CLUSTER-IP      EXTERNAL-IP      PORT(S)          AGE
prometheus-service   LoadBalancer   10.248.11.231   34.141.200.154   8086:30246/TCP   69s
http://34.141.200.154:8086/graph?g0.expr=&g0.tab=1&g0.stacked=0&g0.show_exemplars=0&g0.range_input=1h

COMPROMISES
- GCP is slow given time limit chose to use reference from ready examples and apply to the assignments
- details could be refined thereafter
- approach is to make it work first 
- kubernetes deploy could have been coded into terraform but now seperately handled to save time
- the tf3 config without modules was already working yesterday but to show the use of modules hence another few rounds of GCP setup which took another half day waiting most of the time
- can do with a script to wait for the cluster being ready then apply the rest of the steps auto
### 
