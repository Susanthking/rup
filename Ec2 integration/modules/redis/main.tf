resource "aws_elasticache_parameter_group" "redis7" {
  name   = "redis7-parameter-group"
  family = "redis7"
  description = "Parameter group for Redis 7"

  # Define any additional parameters as needed
  parameter {
    name  = "maxmemory-policy"
    value = "allkeys-lru"
  }
}

resource "aws_elasticache_cluster" "example" {
  cluster_id           = "example"
  engine               = "redis"
  engine_version       = "7.0"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  parameter_group_name = aws_elasticache_parameter_group.redis7.name
  port                 = 6379
}

# # Define subnet group and security group as needed
#subnet_group_name    = aws_elasticache_subnet_group.example.name
#  security_group_ids   = [aws_security_group.example.id]
#}

output "cache_nodes" {
value = aws_elasticache_cluster.example.cache_nodes
}