## OCI Terraform Genai Service Infra
Oracle Cloud Infrastructure Generative AI is a fully managed service that provides a set of state-of-the-art, customizable large language models (LLMs) that cover a wide range of use cases
This terraform stack helps to accelerate the GenAI service bootstrap with various resources including a sample data.

### Pictorial view 

![picutre](images/genai_service_infra.jpg)

### Resource details.

1. An object storage bucket with a sample `jsonl` data which will be used for creating a custom model.
1. A Generative AI Dedicated Cluster (DAC) for tune the model with the sample data from object storage.
1. A fine-tuned custom model.
1. A Generative AI Dedicated Cluster (DAC) for hosting the custom model and endpoints to access the custom model.

## Deploy Using Oracle Resource Manager

1. Click [![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?region=home&zipUrl=https://github.com/oracle-devrel/oci-terraform-genai-service-infra/releases/latest/download/oci-terraform-genai-service-infra-stack-latest.zip)

   If you aren't already signed in, when prompted, enter the tenancy and user credentials.

2. Review and accept the terms and conditions.

3. Select the region where you want to deploy the stack.

4. Follow the on-screen prompts and instructions to create the stack.

5. After creating the stack, click **Terraform Actions**, and select **Plan**.

6. Wait for the job to be completed, and review the plan.

   To make any changes, return to the Stack Details page, click **Edit Stack**, and make the required changes. Then, run the **Plan** action again.

7. If no further changes are necessary, return to the Stack Details page, click **Terraform Actions**, and select **Apply**.

### A snippet of OCI Resource manager usage.

![ocirms](images/use.gif)

### Validate the Deployment

- Using `OCI Console` > `AI Services` > `Generative AI` ,validate the resources.
- The custom model can be available via `OCI Generative AI > Playground`

## Deploy Using the Terraform CLI

### Clone the Module

Now, you'll want a local copy of this repo. You can make that with the commands:

```shell
$ git clone  https://github.com/oracle-devrel/oci-terraform-genai-service-infra
$ cd oci-terraform-genai-service-infra
$ ls
```
### Prerequisites
First off, you'll need to do some pre-deploy setup.  That's all detailed [here](https://github.com/cloud-partners/oci-prerequisites).

Secondly, create a `terraform.tfvars` file and populate with the following information:
```terraform
# Authentication
tenancy_ocid         = "OCID of OCI Tenancy"
user_ocid            = "OCID of the OCI User"
fingerprint          = "FingerPrint of OCI User"
private_key_path     = "Path to Private Key"

# Region
region = "OCI Region"

# Compartment
compartment_id = "OCID of OCI Compartment"
```


Deploy:
```shell
$ terraform init
$ terraform plan
$ terraform apply
```
### Validate the Deployment

- Using `OCI Console` > `AI Services` > `Generative AI` ,validate the resources.
- The custom model can be available via `OCI Generative AI > Playground`


## Destroy the Deployment
Delete the data file used for fine-tuned from  `OCI Object-storage bucket` then follow terraform command and destroy.

```shell
 $ terraform destroy
```
   
## Contributing
This project is open source.  Please submit your contributions by forking this repository and submitting a pull request!  Oracle appreciates any contributions that are made by the open source community.

### Attribution & Credits
- Rahul M R (https://github.com/RahulMR42)

## License
Copyright (c) 2024 Oracle and/or its affiliates.
Licensed under the Universal Permissive License (UPL), Version 1.0.
See [LICENSE](LICENSE) for more details.
