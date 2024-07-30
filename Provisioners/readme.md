**Terraform includes the concept of provisioners as a measure of pragmatism, knowing that there are always certain behaviors that cannot be directly represented in Terraform's declarative model**

` **provisioners are 3 types** `

```  

  file    - used for copying files from one location to another location - source to destination
  
  local-exec  - performs actions on local machine
  
  remote-exec - performs actions on remote machine 

```



file :

Please find the output for file provisioner

![image](https://github.com/user-attachments/assets/eba2632e-646b-4d5c-b109-84d07d5feb75)




Failure Behavior

By default, provisioners that fail will also cause the Terraform apply itself to fail. The on_failure setting can be used to change this. The allowed values are:

    continue - Ignore the error and continue with creation or destruction.

    fail - Raise an error and stop applying (the default behavior). If this is a creation provisioner, taint the resource.
