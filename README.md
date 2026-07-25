## About
As a AWS DevOps Engineer / Site Reliability, I use Terraform to automate cloud infrastructure. 
This portfolio highlights reusable `.tf` files, modules, and real-world scenarios like VPC setups, EC2 provisioning, and CI/CD pipelines.


# What is Terraform?
Terraform is an open‑source Infrastructure as Code (IaC) tool created by HashiCorp. It allows you to define, provision, and manage cloud infrastructure using simple, declarative configuration files written in HCL (HashiCorp Configuration Language).What is Terraform?
Terraform is an open‑source Infrastructure as Code (IaC) tool created by HashiCorp. It allows you to define, provision, and manage cloud infrastructure using simple, declarative configuration files written in HCL (HashiCorp Configuration Language).

## Workfolw
1. Write → Define .tf files
2. Init → Download providers, set backend
3. Validate/Format → Ensure correctness
4. Plan → Preview changes
5. Apply → Provision infrastructure
6. State → Track resources
7. Change → Update infra safely
8. Destroy → Clean up

## Write Configuration
1. You define infrastructure in .tf files using HCL (HashiCorp Configuration Language).
2. This is declarative: you describe what you want, not how to build it.

## Initialize 
terraform init
1. Prepares your working directory.
2. Downloads provider plugins (AWS, Azure, GCP, Kubernetes, etc.).
3. Sets up the backend for state management (local or remote like S3 + DynamoDB).
4. Must be run once per project or after adding new providers/modules.

## Format & Validate
terraform fmt & terraform validate
1. formats code consistently.
2. checks syntax and configuration correctness.
3. Helps maintain clean, error‑free code before execution.

## Plan 
terraform plan
1. Creates an execution plan showing what Terraform will do.
2. Compares your .tf files with the current state (terraform.tfstate).
3. Outputs actions: create, update, or destroy resources.
4. Safe step to preview changes before applying.

## Apply 
terraform apply
1. Executes the plan and provisions infrastructure.
2. Prompts for confirmation unless you use -auto-approve.
3. Updates the state file to reflect the new infrastructure.
4. After this step, your resources are live in the cloud.

## State Management
1. Terraform maintains a state file (terraform.tfstate) to track resources.
2. State ensures Terraform knows what exists and prevents duplication.
3. Best practice: store state remotely (S3, Terraform Cloud) with locking (DynamoDB) for team collaboration.

## Change Management
1. When you edit .tf files (e.g., change instance type), run plan again.
2. Terraform calculates the difference and applies only necessary changes.
3. Ensures idempotency: running the same config multiple times yields the same result.

## Destroy 
terraform destroy
1. Tears down all resources defined in your configuration.
2.  Useful for cleaning up test environments.
3. Also updates the state file to reflect that resources no longer exist.

# Terraform Variables
Terraform variables are a way to store values that can be reused throughout your Terraform configuration.
They allow you to define a value once and reference it in multiple places throughout your configuration, making it easier to manage and update your infrastructure.

1. Variables are defined in the variables block in your Terraform configuration file, where you can give a name and a default value.
2. Terraform variables can have various type such as ***string, number, boolean, list, map*** etc.
3. Variables can be set in the command line when running Terraform commands using the **-var** flag.
4. Variables can also be set using a separate file, called a variable file, using the **-var-file** flag.
5. Variables can be accessed in Terraform configuration files using the var function, for example **var.example_variable**.
6. Variables are useful for storing values that may change between environments, for example, different values for test and production environments.

# Types of Terraform Variables
## Simple Values variables
As the name suggests Simple Values variables are which hold only a single value.
1. string : Used for text values like names, IDs, or regions.
2. number : Used for numeric values like instance counts or sizes.
3. bool : Used for true/false flags, often to enable/disable features.

## Collection Variable
It can be able to multiple values.
1. List : A list is an ordered collection of values.
2. Map : A map is a collection of key‑value pairs.
3. Set : A set is an unordered collection of unique values (no duplicates).

## Terraform Output Variables
-  In Terraform, output variables allow you to easily extract information about the resources that were created by Terraform. They allow you to easily reference the values of resources after Terraform has finished running.
- Output variables are defined in the ***outputs*** block in the Terraform configuration file.
- They also enable you to access the values of resources that are not directly visible in the Terraform state, such as the IP address of an EC2 instance.
- It's worth noting that you can also set the output variable to be sensitive, in that case, Terraform will mask the output value when it appears in output, making it more secure.

## tfvars file
- This file content the variables in key value pair. 
- In Terraform, we can pass variables from a tfvars file as command-line arguments using the ***-var-file*** flag. The -var-file flag allows you to specify a file containing variable values, which will be used when running Terraform commands.
- A typical tfvars file should contain the variables that you want to pass to Terraform. Each variable should be in the form of ***variable_name = "value"***
- **But you should also create a variable.tf file also to define the variable type**. variables.tf and terraform.tfvars file containing the variables.
- You can also specify multiple variable files by using the ***-var-file*** flag multiple times on the command line.
  e.g. '''bash(terraform apply -var-file=myvars-1.tfvars -var-file=myvars-2.tfvars)
- It's worth noting that variables defined in the command line options will have higher priority than the variables defined in the tfvars files.

# Terraform Workspace
Terraform worksapces is a very logical concept where you can have multiple states of your infrastructure configuration. To put this in simple words if you are running an infrastructure configuration in development environment then the same infrastructure can be run in the production environment.

The main benefit of terraforming workspaces we get is we can have more than one state associated with a single terraform configuration.

If you have not defined any workspace then there is always a default workspace created by terraform, so you always work in a default workspace of terraform. You can list the number of terraform workspaces by running the command terraform workspace show. Also, you can not delete the default workspace.

$ terraform workspace list 
It will list out all the workspaces

$ terraform workspace new prod 
It create a workspace and swtich to prod. Similary you can create

$ terraform workspace new dev
added new workspace dev

$ terraform workspace show 
It will show the current workspace you are in

$ terraform apply -var-file dev.tfvars
to  apply changes

$terraform workspace select prod
To Switch workspace
