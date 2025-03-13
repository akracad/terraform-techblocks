. Service Account Key File (JSON)
This is the most common and recommended approach for authenticating Terraform to GCP.

Create a Service Account:

Go to the GCP Console.
Navigate to IAM & Admin > Service Accounts.
Create a service account and assign the necessary roles (e.g., Editor, Owner, or any specific role your Terraform deployment requires).
Create a JSON key for that service account.
Set the Environment Variable: After downloading the JSON key, set the GOOGLE_APPLICATION_CREDENTIALS environment variable to point to your key file:

bash
Copy
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/your/service-account-file.json"
Configure Terraform: Terraform will automatically use the credentials from the GOOGLE_APPLICATION_CREDENTIALS environment variable.