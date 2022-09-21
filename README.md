# terraform-urban
Prerequisites: 
1) You should start with **gcloud auth login** and enter your credentials. export $PROJECT_NAME= "PROJECT ID" && export $REGION= "PROJECT REGION"
2) Open the GCP portal, Go to **APIs & Services - Credentials - CREATE CREDENTIALS ** and download the .json file, change the credentials.tf file to point your .json file
Usage: 

1) **cd development && terraform init **
2) **terraform apply **
This will cause to start .tf files which will deploy infrastructure.
Currently now you will get an error, because you  need to use **gcloud container clusters get-credentials dev-gke-example --region $REGION --project $PROJECT_NAME** after the error in terraform
3) **terraform apply **  -app is deployed and Load balancer and Ingress Controller installed 

