In Terraform, a **module** is a container for multiple resources that are used together. Modules help you organize your configuration into smaller, reusable parts. Using modules in Terraform allows you to manage complex configurations by breaking them into smaller, more manageable pieces, making your code more modular, reusable, and easier to maintain.

A **module block** is used to call a module and pass variables to it, which can contain resources, data sources, outputs, and other configurations. Modules can either be local (within the same repository) or external (from a remote source like the Terraform Registry).

### Structure of a Module Block

```hcl
module "module_name" {
  source = "source_of_the_module"
  # Optional variables (inputs) for the module
  variable_name_1 = "value1"
  variable_name_2 = "value2"
}
```

- **`module_name`**: This is the name you give to the module call. It can be any identifier.
- **`source`**: This is the location of the module. It can be a local directory, a Git repository, a Terraform Registry module, or other sources.
- **Variables (inputs)**: You can pass values to the module through input variables. These values will be used by the module.

### Example of Using a Module

#### 1. **Basic Example: Using a Local Module**

Let’s say you have a local module that creates an AWS EC2 instance. The directory structure might look like this:

```
.
├── main.tf
└── modules
    └── ec2_instance
        └── main.tf
```

- **`modules/ec2_instance/main.tf`** (Local module):

```hcl
# Module to create an EC2 instance
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
}

# Define the input variables
variable "ami_id" {}
variable "instance_type" {}
```

- **`main.tf`** (Calling the module):

```hcl
provider "aws" {
  region = "us-west-2"
}

module "ec2_instance" {
  source        = "./modules/ec2_instance"
  ami_id        = "ami-0c55b159cbfafe1f0"  # Example AMI ID
  instance_type = "t2.micro"
}
```

In this example:
- The **`module "ec2_instance"`** block is calling the `ec2_instance` module.
- The module’s **`ami_id`** and **`instance_type`** variables are being passed values from the main configuration.
- The module uses these values to create an EC2 instance in AWS.

#### 2. **Using an External Module (Terraform Registry)**

Modules can also be sourced from the [Terraform Registry](https://registry.terraform.io/), Git repositories, or other locations.

Example: Using an external module to create an AWS VPC from the Terraform Registry:

```hcl
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "example-vpc"
  cidr   = "10.0.0.0/16"
  azs    = ["us-west-2a", "us-west-2b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
```

In this example:
- The `source` points to the module `terraform-aws-modules/vpc/aws` from the Terraform Registry.
- The module is configured with the necessary parameters to create a VPC, subnets, and availability zones.
- The `vpc_id` is output by the module and referenced in your main configuration.

### Input Variables for Modules

Modules can accept **input variables** to make them reusable in different environments or configurations. Input variables allow you to pass dynamic values to the module when calling it.

#### Example: Defining Input Variables

- **`modules/ec2_instance/variables.tf`** (Inside the module):

```hcl
variable "ami_id" {
  description = "The AMI ID to launch the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The type of the EC2 instance"
  type        = string
}
```

- **`main.tf`** (Calling the module):

```hcl
module "ec2_instance" {
  source        = "./modules/ec2_instance"
  ami_id        = "ami-0c55b159cbfafe1f0"  # Example AMI ID
  instance_type = "t2.micro"
}
```

In this case, the module **`ec2_instance`** has two input variables: `ami_id` and `instance_type`, and these values are provided when calling the module.

### Output Variables from Modules

Modules can also output values that can be used in the parent configuration. You define output variables inside the module, and then refer to those outputs when calling the module.

#### Example: Defining and Using Output Variables

- **`modules/ec2_instance/outputs.tf`** (Inside the module):

```hcl
output "instance_id" {
  value = aws_instance.example.id
}
```

- **`main.tf`** (Calling the module):

```hcl
module "ec2_instance" {
  source        = "./modules/ec2_instance"
  ami_id        = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

output "ec2_instance_id" {
  value = module.ec2_instance.instance_id
}
```

Here:
- The `module "ec2_instance"` block outputs the `instance_id` of the EC2 instance.
- The parent configuration captures this output using `module.ec2_instance.instance_id` and can use it in other resources or as an output.

### Module Best Practices

1. **Use Modules for Reusability**: Break your configuration into reusable pieces using modules. This is especially helpful for repeated resources like VPCs, security groups, or EC2 instances.
2. **Keep Modules Small and Focused**: Each module should do one thing well. Avoid making them too complex or tightly coupled.
3. **Organize Module Code**: Keep the module code separate from your main configuration. This makes it easier to maintain and share.
4. **Version Modules**: When using external modules, specify the version to ensure consistency across environments.

### Conclusion

- **Module block**: Allows you to encapsulate and reuse Terraform code.
- **Input variables**: Allow you to customize the module’s behavior by passing in different values.
- **Output variables**: Allow modules to return values that can be used in the parent configuration.
- **Source**: Modules can be sourced locally or remotely (from the Terraform Registry, Git, etc.).

By using modules, you can create reusable, maintainable, and more organized Terraform configurations.