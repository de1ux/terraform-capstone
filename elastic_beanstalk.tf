resource "aws_elastic_beanstalk_application" "capstone_application" {
  name        = "Capstone-terraform"
  description = "Terraformed ElasticBeanstalk application"
}

resource "aws_elastic_beanstalk_environment" "capstone_environment" {
  name                = "Capstone-terraform"
  application         = aws_elastic_beanstalk_application.capstone_application.name
  solution_stack_name = "64bit Amazon Linux 2 v5.7.0 running Node.js 14 "

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     =  "aws-elasticbeanstalk-ec2-role"
  }

  setting {
    namespace = "aws:rds:dbinstance"
    name      = "DBAllocatedStorage"
    value     = "10"
  }

  setting {
    namespace = "aws:rds:dbinstance"
    name      = "DBDeletionPolicy"
    value     = "Delete"
  }

  setting {
    namespace = "aws:rds:dbinstance"
    name      = "HasCoupledDatabase"
    value     = "true"
  }

  setting {
    namespace = "aws:rds:dbinstance"
    name      = "DBEngine"
    value     = "postgres"
  }

  setting {
    namespace = "aws:rds:dbinstance"
    name      = "DBEngineVersion"
    value     = "13.7"
  }

  setting {
    namespace = "aws:rds:dbinstance"
    name      = "DBInstanceClass"
    value     = "db.t3.micro"
  }

  setting {
    namespace = "aws:rds:dbinstance"
    name      = "DBPassword"
    value     = var.rds_password
  }
}