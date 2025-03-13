Application Default Credentials (ADC)
GCP provides Application Default Credentials (ADC), which can automatically find your credentials if you are running Terraform on a GCP-hosted environment (like Compute Engine or Cloud Shell).

Set Up ADC:

Install the Google Cloud SDK if you haven't already.
Run gcloud auth application-default login to authenticate with your Google account.
Terraform will use the credentials set by gcloud auth application-default login.
Note: If you're using a service account with specific roles and permissions, it's better to stick with the service account key method.