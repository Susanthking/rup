resource "aws_elasticache_cluster" "example" {
  cluster_id           = "example"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
}

output "cache_nodes" {
  value = aws_elasticache_cluster.example.cache_nodes
}