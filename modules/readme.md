**Modules** :  **Modules are self-contained packages of Terraform configurations that are managed as a group.**

link : [modules](https://registry.terraform.io/browse/modules)

#syntax :

**` remote state : `**

``` module "iam" {     #resource name
  source  = "terraform-aws-modules/iam/aws"  #source is required
  version = "5.41.0"  #version of the source
}
```
**` local modules `**
```
module <module_name> {
source = <path to be provided where module file >
}
```
