resource "aws_db_subnet_group" "db_subnets" {
  name       = "${local.name_prefix}-db-subnets"
  subnet_ids = aws_subnet.private[*].id
}

resource "aws_db_instance" "db" {
  identifier              = "${local.name_prefix}-db"
  engine                  = "postgres"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.db_subnets.name
  vpc_security_group_ids  = [aws_security_group.db_sg.id]
  multi_az                = true
  backup_retention_period = 7
  skip_final_snapshot     = true
  storage_encrypted       = true
}
