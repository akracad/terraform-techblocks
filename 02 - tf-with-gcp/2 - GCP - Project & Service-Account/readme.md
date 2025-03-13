GCP Project 

A Google Cloud project is required to use Google Workspace APIs and build Google Workspace add-ons or apps. A Cloud project forms the basis for creating, enabling, and using all Google Cloud services, including managing APIs, enabling billing, adding and removing collaborators, and managing permissions.

GCP - Service Account

A Google Cloud Platform (GCP) service account is a special Google account that's used by applications or virtual machines (VMs). Service accounts are managed by Identity and Access Management (IAM). 


Purpose

To grant permissions to VMs instead of end users 
To ensure safe, managed connections to APIs and Google Cloud services 
To authenticate and authorize actions on behalf of non-human entities 

How they work 

Applications use service accounts to make authorized API calls
You can attach a service account to a resource running the application
You can grant the service account IAM roles to let it access Google Cloud resources

Benefits 

Service accounts help ensure safe, managed connections to APIs and Google Cloud services
They help grant access to trusted connections and reject malicious ones

Use cases
You can use service accounts to interact with other GCP services, such as BigQuery, Cloud Storage, Amazon Redshift, and more 
You can use service accounts to build applications on Google Cloud Platform 