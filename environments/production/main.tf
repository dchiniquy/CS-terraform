
module "network" {
  source = "../../modules/networking"

  vpc_name = "prod-vpc"

  public_subnet_configs = [
    {
      name   = "public-subnet-1"
      cidr   = "10.0.1.0/24"
      region = "us-central1"
    },
    {
      name   = "public-subnet-2"
      cidr   = "10.0.2.0/24"
      region = "us-east1"
    }
  ]

  private_subnet_configs = [
    {
      name   = "private-subnet-1"
      cidr   = "10.0.3.0/24"
      region = "us-central1"
    },
    {
      name   = "private-subnet-2"
      cidr   = "10.0.4.0/24"
      region = "us-east1"
    }
  ]

  nat_region = "us-central1"

  tags = {
    environment = "production"
  }
}

module "gce_autoscaling" {
  source = "../../modules/compute"

  instance_name  = "prod-instance"
  machine_type   = "n1-standard-1"
  region         = "us-central1"
  zone           = "us-central1-a"
  image          = "debian-cloud/debian-10"
  vpc_id         = module.network.vpc_id
  subnetwork_id  = module.network.public_subnet_ids[0]
  tags           = {
    environment = "production"
  }
  min_replicas   = 1
  max_replicas   = 5
  cpu_target     = 0.6
  source_ranges  = [module.network.vpc_cidr]
}

module "database" {
  source = "../../modules/database"

  db_instance_name   = "prod-db-instance"
  db_version         = "MYSQL_8_0"
  region             = "us-central1"
  db_tier            = "db-f1-micro"
  db_name            = "production_db"
  db_user            = "admin"
  db_password        = "securepassword"
  authorized_networks = [
    {
      name  = "autoscaler-instances"
      value = module.gce_autoscaling.instance_group_cidr
    }
  ]
}