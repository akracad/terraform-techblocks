Connect Terraform with GCP

Multipl ways to authenticate with GCP

1 - username/passwd - gcloud auth default login
2 - Google cloud VM
3 - Service Account - Keys (Preferref in prod)

There are several ways to authenticate Terraform to Google Cloud Platform (GCP). Here are the most common methods:

### 1. **Service Account Key File (JSON)**
   This is the most common and recommended approach for authenticating Terraform to GCP.

   - **Create a Service Account:**
     1. Go to the GCP Console.
     2. Navigate to **IAM & Admin** > **Service Accounts**.
     3. Create a service account and assign the necessary roles (e.g., `Editor`, `Owner`, or any specific role your Terraform deployment requires).
     4. Create a JSON key for that service account.

   - **Set the Environment Variable**:
     After downloading the JSON key, set the `GOOGLE_APPLICATION_CREDENTIALS` environment variable to point to your key file:
     ```bash
     export GOOGLE_APPLICATION_CREDENTIALS="/path/to/your/service-account-file.json"
     ```
   - **Configure Terraform**:
     Terraform will automatically use the credentials from the `GOOGLE_APPLICATION_CREDENTIALS` environment variable.

### 2. **Application Default Credentials (ADC)**
   GCP provides Application Default Credentials (ADC), which can automatically find your credentials if you are running Terraform on a GCP-hosted environment (like Compute Engine or Cloud Shell).

   - **Set Up ADC:**
     1. Install the Google Cloud SDK if you haven't already.
     2. Run `gcloud auth application-default login` to authenticate with your Google account.
     3. Terraform will use the credentials set by `gcloud auth application-default login`.

   - **Note**: If you're using a service account with specific roles and permissions, it's better to stick with the service account key method.

### 3. **Using `gcloud` Command-Line Tool for Authentication**
   If you have the `gcloud` CLI tool installed and authenticated, you can use it for authentication.

   - **Authenticate with `gcloud`**:
     ```bash
     gcloud auth login
     ```
     Then, set the active project:
     ```bash
     gcloud config set project <YOUR_PROJECT_ID>
     ```

   - **Tell Terraform to use `gcloud` credentials**:
     Terraform can use `gcloud` credentials by specifying the `GOOGLE_CLOUD_AUTH` environment variable or not setting any explicit credentials. Terraform will check for existing `gcloud` credentials.

### 4. **OAuth 2.0 Authentication (Interactive)**
   This method is often used in local development or environments that require user interaction.

   - **Run `gcloud auth application-default login`**:
     This prompts you to log in using your Google credentials, then sets up the necessary authentication locally for Terraform.

### 5. **Using Google Cloud Identity and Access Management (IAM) with Workload Identity Federation (WIF)**
   This is a more advanced method suited for environments where you want to federate identities between GCP and external identity providers (like AWS, Azure, etc.).

   Workload Identity Federation allows you to authenticate without using a service account key file by configuring your identity provider to use GCP's Workload Identity Federation.

   - You would configure the identity provider to trust GCP for access to the resources.
   - This method is ideal when you're managing workloads across multiple cloud environments.

### 6. **Terraform Cloud or Terraform Enterprise Authentication**
   If you're using Terraform Cloud or Terraform Enterprise, you can configure your GCP credentials through the platform's user interface.

   - In Terraform Cloud, you can set up a "Google Cloud" authentication method under the **Workspace Variables** section. You can provide a service account key or set up Google OAuth for the workspace.

### 7. **Environment Variables in `provider` Block (Explicit Authentication)**
   Instead of relying on the `GOOGLE_APPLICATION_CREDENTIALS` environment variable, you can specify your credentials explicitly within the `provider` block in your Terraform configuration.

   ```hcl
   provider "google" {
     credentials = file("<path-to-your-service-account-key>.json")
     project     = "<your-project-id>"
     region      = "<your-region>"
   }
   ```

   This approach is less flexible, but it can be useful for certain cases like automating Terraform runs through CI/CD pipelines.

### Summary:
- **Service Account Key File (JSON)**: Common and recommended method.
- **Application Default Credentials**: Ideal for GCP environments (Compute Engine, Cloud Shell).
- **gcloud CLI**: Easy for users already authenticated with `gcloud`.
- **OAuth 2.0 (Interactive)**: Best for local development.
- **Workload Identity Federation**: Advanced, for federating identities across clouds.
- **Terraform Cloud**: For teams using Terraform Cloud/Enterprise.

Each of these methods can be chosen based on your environment and security requirements.