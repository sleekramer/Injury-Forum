require "refile/s3"

aws = {
  access_key_id: ENV["ACCESS_KEY_ID"],
  secret_access_key: ENV["SECRET_ACCESS_KEY"],
  region: "us-east-1",
  bucket: "injury-forum-images",
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
