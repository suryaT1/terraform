**Terraform workspaces enable us to manage multiple deployments of the same configuration. When we create cloud resources using the Terraform configuration language, the resources are created in the default workspace. It is a very handy tool that lets us test configurations by giving us flexibility in resource allocation, regional deployments, multi-account deployments, and so on.**



``` workspace cmnds ```

` terraform workspace new <workspace name >`  # used for creating new workspace

` terraform workspace list `     # it will fetch the list of workspaces we had 

` terraform workspace show `    # shows the current workspace ( *)

` terraform workspace select <workspace name > `   # selecting the required workspace --> move to other workspace




it will create separate terraform state files for each workspace and stores in **Workspaces/terraform.tfstate.d** 

refer [state files ](terraform.tfstate.d)


```
**Usage: terraform [global options] workspace**

  new, list, show, select and delete Terraform workspaces.

Subcommands:
    delete    Delete a workspace
    list      List Workspaces
    new       Create a new workspace
    select    Select a workspace
    show      Show the name of the current workspace  ```
