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
