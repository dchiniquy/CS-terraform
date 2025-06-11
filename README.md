# CS-terraform
Sample terraform project for a web application deployed in Google Cloud. 

# brief explanation on the pattern used
This uses resource type modules as an abstraction that would allow us to deploy each environment separately. I only created the terraform for the "production" environment. It is assumed the GCP project and account are inside the credentials file. 

I am intending to use a remote state with this project and enable database locking. This allows for multiple team members to use / modify the same terraform state with relative safety. 

I didn't use workspaces or makefiles for this simple example. In a production environment, it could be very helpful to bootstrap the creation of the project / remote backend into a makefile. Using this pattern I would also add common tags in a more meaningful way than just tags as a variable. We could also leverage workspaces if the developer use case warrants an extra level of separation, and our git repos have very good naming scheme. 

This terraform repo contains code for the following resources: 

- Network module with VPC, public and private subnets, an internet gateway, and a firewall rules that allow both public access to the load balancer, ssh access to the instance (currently open to all just for this example) and allows the compute backend to access the database. 

- The compute resources are using an autoscaler, backend service, URL map that should allow public access to the autoscaler

- There is a mysql database instance that is also created and through a firewall rule I have access from the GCE compute resources to the database instance. 

I time boxed this exercise to 2 hours. I would have loved to get to the actual deploy of a real app, but that would have taken more than 2 hours without using AI tools. 
