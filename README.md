# terraform-urban
This project creates the GKE cluster and provisions it with the application image from Container Registry.
Some modules were copied from https://github.com/FairwindsOps/terraform-gke and adopted to this particular case.
# Prerequisites: 
1) You should start with **gcloud auth login** and enter your credentials. export $PROJECT_NAME= "PROJECT ID" && export $REGION= "PROJECT REGION"
2) Open the GCP portal, Go to **APIs & Services - Credentials - CREATE CREDENTIALS** and download the .json file, change the credentials.tf file to point your .json file. Create **Cloud Storage Account** and paste the name to backend.tf file.
3) replace the image name from **Container Registry** to yours value in .auto.tf.vars (container_image)

# Usage: 

1) **cd development && terraform init**
2) **terraform apply**
This will cause to start .tf files which will deploy infrastructure.
Currently now you will get an error, because you  need to use **gcloud container clusters get-credentials $YOURGKECLUSTER --region $REGION --project $PROJECT_NAME** after the error in terraform
3) **terraform apply**  -app is deployed and Load balancer installed

# Unresolved problems: 
1) need to configure more secure way to store credentials file( sops/export to envs)
2) need to create null-resource to start the script with gke authentication(not manually as it is now(with 2nd terraform apply)) 
4) need to create a pipeline or some kind of thing to replace image name that will be used for deployment
3) need to create GCS before deployment process because backend requires to be before deployment process ( need to create separate folder with only gcs.tf file and start deployment process from here OR terraform apply -target=module.gcsmodule )
4) need to configure DNS and SSL at least for the production needs
5) need to create container registry before the infrastructure creation.


   
