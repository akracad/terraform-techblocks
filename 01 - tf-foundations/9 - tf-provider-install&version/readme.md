To install and specify the version of a Terraform provider, follow these general steps:

### 1. **Installation of Terraform Provider**

Terraform providers are plugins that allow Terraform to interact with various services (e.g., AWS, Azure, Google Cloud, etc.). When you use a provider, Terraform automatically downloads the necessary provider plugin. You typically specify the required provider in your Terraform configuration file.

Here’s how you can define and install a Terraform provider:

1. **Define the provider in your configuration**:
   In your `main.tf` file (or any `.tf` file), you declare the provider you want to use. For example:

   ```hcl
   terraform {
     required_providers {
       aws = {
         source = "hashicorp/aws"
         version = "4.0.0"
       }
     }
   }

   provider "aws" {
     region = "us-west-2"
   }
   ```

   In this example:
   - `source` specifies the provider’s name and source location (usually from the `hashicorp` namespace).
   - `version` is optional but recommended to ensure compatibility.

2. **Install the provider**:
   After defining the provider in your configuration file, you can run:

   ```bash
   terraform init
   ```

   This command initializes the working directory and automatically downloads the specified providers (along with any necessary Terraform modules).

### 2. **Specifying the Provider Version**

You can specify a version of the provider in your `terraform` block. For example:

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"  # This specifies to use any version from 3.0.0 to below 4.0.0
    }
  }
}
```

The version constraints allow you to control which versions of a provider can be used. Here are some examples of version constraints:

- `= 3.0.0`: Exactly version 3.0.0.
- `> 3.0.0`: Any version greater than 3.0.0.
- `>= 3.0.0`: Any version greater than or equal to 3.0.0.
- `<= 3.0.0`: Any version less than or equal to 3.0.0.
- `~> 3.0`: Any version that’s compatible with 3.0.x but not 4.0.0 (i.e., 3.0.x, 3.1.x, 3.2.x, etc.).
- `>= 3.0, < 4.0`: Any version between 3.0.x and 4.0.x but not including 4.0.x.

### 3. **Verifying Installed Providers**

To see which version of the provider has been installed, you can run:

```bash
terraform providers
```

This command will show you the currently installed providers and their versions.

### 4. **Upgrading or Downgrading Providers**

If you want to upgrade or downgrade to a specific provider version, you can modify the version constraint in your `main.tf` file and then run:

```bash
terraform init -upgrade
```

This will ensure Terraform installs the latest version that matches your specified constraints.

### Example

Here’s an example of a full configuration that specifies the provider version and initializes it:

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"  # Ensures Terraform installs version 4.0.x
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
```

### Conclusion

- Use `terraform init` to install and initialize the required providers.
- Specify the provider version in the `terraform` block using version constraints.
- Use `terraform providers` to see the installed provider versions.
