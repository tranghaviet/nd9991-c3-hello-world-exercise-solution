## Exercise: Define Ansible Playbook

```
ansible-playbook define-ansible-playbook.yml
```

## Exercise: Remote Control Using Ansible

```sh
aws cloudformation deploy \
  --template-file template.yml \
  --stack-name ExerciseRemoteControl

aws ec2 describe-instances \
  --query 'Reservations[*].Instances[*].PublicIpAddress' \
  --output text >> inventory.ini

ansible-playbook -i inventory.ini remote-control.yml --private-key=~/.ssh/udacity
```

## Exercise: Infrastructure Creation

CircleCI workflow should be

```
workflows:
  myWorkflow:
    jobs:
      - create_infrastructure
```

## Exercise: Config and Deployment

Keep previos EC2 instance then update CircleCI workflows

```
workflows:
  myWorkflow:
    jobs:
      - configure_infrastructure
```

## Exercise: Promote to Production

- Create S3 bucket name `udacity-7510a489`
- Upload the index.html page to the bucket
- In `Permissions` tab, turn off `Block public access`
- Then update `Bucket policy` to
- Enable `Static website hosting` point home to `index.html`

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::udacity-7510a489/*"
    }
  ]
}
```

Run command:

```
export S3_BUCKET_NAME="udacity-7510a489"
aws cloudformation deploy \
 --template-file cloudfront.yml \
 --stack-name production-distro \
 --parameter-overrides PipelineID="udacity-7510a489" \
 --tags project=udapeople &
```
