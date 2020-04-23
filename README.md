# Deploy Rosetta at Home in the Cloud for COVID-19 Research

- Got some free cloud credits you want to use up?<br>
[Sign up for $300 in GCP credit](https://cloud.google.com/free)<br>
[Sign up for $200 in Azure credit](https://azure.microsoft.com/en-us/free/)<br>
[Sign up for $300 in Alicloud credit](https://www.alibabacloud.com/campaign/free-trial)<br>
[Sign up for the free tier at AWS](https://aws.amazon.com/free/)<br>
**Wise Owl Says   <(^.^)>**<br>
**You must stop the instance before your free credits are expired if you don't want to get charged)**<br>
- Bored at home and want to use free cloud credits to learn about terraform?

![COVID-19](https://dp9bxf2pat5uz.cloudfront.net/wp-content/uploads/CoVid-19_1080p_c_NW.jpg)
<br>
This will deploy a [Rosetta@Home](http://boinc.bakerlab.org/rosetta) server in the cloud of your choice with [Terraform](https://www.terraform.io/).

That server will then churn at [100% until you turn it off](http://boinc.bakerlab.org/rosetta)

### You will be putting your $$$ or that free cloud provider money to do research while you do something else

## How to use this repo
This repo is [Terraform](https://www.terraform.io/) code.

### Terraform CLI Instructions:
You can download the [Terraform Binary](https://www.terraform.io/downloads.html) if you are already familiar.
1. Copy the ```rosettaathome.auto.tfvars.example``` to ```rosettaathome.auto.tfvars``` and make your edits
1. ```terraform init && terraform plan && terraform apply -auto-apply```
1. ```terraform destroy``` to destroy it

### Terraform Cloud Instructions:
You can also sign up for a [free account on Terraform Cloud](https://app.terraform.io/signup/account).
1. Fork this repo
1. Sign up for a Terraform Cloud account
1. Authorize a GitHub/BitBucket/ADO connection
1. Find this repo you just forked
1. Create a workspace from this repo
   * Set the working dictionary to the cloud you want gcp/aws/azure
1. Setup the required variables
1. Queue a job
1. Help COVID-19 Research

### [GCP](https://console.cloud.google.com/)
#### Required Variables
* [gcp_project_id](https://support.google.com/googleapi/answer/7014113?hl=en)
* [gcp_region](https://cloud.google.com/compute/docs/regions-zones/)
* [gcp_zone](https://cloud.google.com/compute/docs/regions-zones/)
* [boinc_project_id](https://boinc.berkeley.edu/wiki/Boinccmd_tool)
* [instance_type](https://cloud.google.com/compute/docs/machine-types)
* [gcp_credentials](https://cloud.google.com/docs/authentication/getting-started)
    * Uncomment the credentials line in the provider.tf
    * Drop your gcp_credentials.json in the root gcp folder, if you are rolling that way

For Terraform Cloud, just enter the variables on the variables page in the workspace.

### AWS
#### Required Variables
* [boinc_project_id](https://boinc.berkeley.edu/wiki/Boinccmd_tool)
* [ssh_key_name](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)
* [aws_access_key](https://aws.amazon.com/blogs/security/wheres-my-secret-access-key/)
* [aws_secret_key](https://aws.amazon.com/blogs/security/wheres-my-secret-access-key/)
* [aws_region](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html)
* [instance_type](https://aws.amazon.com/ec2/instance-types/)


### Azure
#### Required Variables
* subscription_id
* client_id
* client_secret
* tenant_id




### AliCloud
#### Required Variables
* [access_key](https://www.alibabacloud.com/help/doc-detail/29009.htm)
* [secret_key](https://www.alibabacloud.com/help/doc-detail/29009.htm)
