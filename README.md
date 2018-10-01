## Example next.js app w/ starter deployment scripts

### Next.js/node.js commands

See package.json/scripts for a full command list.

### Terraform

`terraform` contains the tools to push the app to AWS with terraform. It sets up an ALB, ECS service, and networking infrastructure to run the system. This could be extended to provide a database as well. However, it's even easier to use now and eliminates much of the devops overhead. The typical commands here are

```
terraform plan
terraform apply
terraform get
terraform refresh
```

But you should check out their CLI reference.

### Docker

Build a docker image from the include `Dockerfile` with 

```
docker build .
```

### Docker compose

You can start the app and `amazon/dynamodb-local` with

```
docker-compose up -d
```
