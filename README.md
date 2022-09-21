# terraform-urban
# Prerequisites: 
1) You should start with **gcloud auth login** and enter your credentials. export $PROJECT_NAME= "PROJECT ID" && export $REGION= "PROJECT REGION"
2) Open the GCP portal, Go to **APIs & Services - Credentials - CREATE CREDENTIALS** and download the .json file, change the credentials.tf file to point your .json file. Create **Cloud Storage Account** and past the name to backend.tf file.


# Usage: 

1) **cd development && terraform init**
2) **terraform apply**
This will cause to start .tf files which will deploy infrastructure.
Currently now you will get an error, because you  need to use **gcloud container clusters get-credentials dev-gke-example --region $REGION --project $PROJECT_NAME** after the error in terraform
3) **terraform apply **  -app is deployed and Load balancer and Ingress Controller installed 

# Unresolved problems: 
1) need to configure more secure way to store credentials file( sops/export to envs)
2) needed to create null-resource to start the script with gke authentication(not manually as it is now) 
3) need to create GCS before deployment process because backend requires to be before deployment process ( need to create separate folder with only gcs.tf file and start deployment process from here OR terraform apply -target=module.gcsmodule )
4) need to configure DNS and SSL for the production needs
