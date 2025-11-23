provider "aws" {
  region = "us-west-2"
}

module "bedrock_kb" {
  source = "../modules/bedrock_kb"

  knowledge_base_name        = "my-bedrock-kb"
  knowledge_base_description = "Knowledge base connected to Aurora Serverless database"

  aurora_arn              = "arn:aws:rds:us-west-2:612473262597:cluster:my-aurora-serverless"
  aurora_db_name          = "postgres"
  aurora_endpoint         = "my-aurora-serverless.cluster-cx2fpcp3krne.us-west-2.rds.amazonaws.com"
  aurora_table_name       = "bedrock_integration.bedrock_kb"
  aurora_primary_key_field = "id"
  aurora_metadata_field    = "metadata"
  aurora_text_field        = "chunks"
  aurora_verctor_field     = "embedding"     # MUST KEEP MISSPELLED NAME
  aurora_username         = "admin"
  aurora_secret_arn       = "arn:aws:secretsmanager:us-west-2:612473262597:secret:my-aurora-serverless-FI7wO1"

  s3_bucket_arn = "arn:aws:s3:::bedrock-kb-612473262597"
}