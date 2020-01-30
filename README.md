

# Exegol

## What is this ?

Starts an s3fs container mounting an s3 bucket containing sudoreplay backups. You can run sudoreplay commands against the container with the "replay" subcommand.  
The tool is designed to have environments in separate buckets, access can be restricted for users.  

### Build exegol image.
```
docker build -t kronostechnologies/exegol .
```

#### Or pull it from docker hub.
```
docker pull kronostechnologies/exegol
```

## Environment variables

These can be placed in ~/.exegol

##### AWS_PROFILE
Profile configured in your local ~/.aws.

##### S3_BUCKET_PREFIX
This string will be prepended to form the bucket name.

##### S3_BUCKET_SUFFIX
This string will be appended to form the bucket name.

##### S3_BUCKET
Specify a static s3-bucket name, if needed.

## Examples

### IAM role example
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Statement",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:ListObjects",
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::prefix-env-suffix/*",
                "arn:aws:s3:::prefix-env-suffix"
            ]
        }
    ]
}
```

### Bootstrap an environment.
```
./exegol bootstrap __environment__
```

### Run sudoreplay at a bootstrapped environment.
```
./exegol replay __environment__ -l
```

### Display bootstrapped environments.
```
./exegol status
```

### Destroy previously bootstrapped environment.
```
./exegol destroy __environment__
```

### Displays help.
```
./exegol help
```