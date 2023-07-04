## Exercise: Define Ansible Playbook

```
ansible-playbook main.yml
```

## Exercise: Remote Control Using Ansible

```sh
aws cloudformation deploy \
  --template-file template.yml \
  --stack-name ExerciseRemoteControl

aws ec2 describe-instances \
   --query 'Reservations[*].Instances[*].PublicIpAddress' \
   --output text >> inventory.ini

ansible-playbook -i inventory.ini main-remote.yml --private-key=~/.ssh/udacity
```
