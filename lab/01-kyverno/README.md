# Kyverno

## Example
```sh
# policy
> kubectl apply -f exempla/policy/

# deploy 
## error
> kubectl apply -f exempla/deploy/nginx-error.yaml 
Error from server: error when creating "exempla/deploy/nginx-error.yaml": admission webhook "validate.kyverno.svc-fail" denied the request: 

resource Deployment/default/nginx was blocked due to the following policies 

require-requests-limits:
  autogen-validate-resources: 'validation error: CPU and memory resource requests
    and limits are required. rule autogen-validate-resources failed at path /spec/template/spec/containers/0/resources/limits/'

## right
> kubectl apply -f exempla/deploy/nginx.yaml 
deployment.apps/nginx created
```


## Install Toolkit
```
 ------------------------------------
 Kyverno
 ------------------------------------

 make | help command
 make init | Run terragrunt init
 make plan | Run terragrunt plan
 make apply | Run terragrunt apply
 make all | Run terragrunt [init,plan,apply]
 make destroy | Run terragrunt destroy
 make clean | Clean all cache directories
```