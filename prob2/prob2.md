# Problem 2
Problem 2 continues where you left from Problem 1. We assumes you complete your playbook in Problem 1 such that all
servers are in the desired state.

In Problem 2, we'd like you to deploy a 3rd-party script to servers. Because we do not own this 3rd-party script, we
DO NOT want to change anything in the script file but expect it just "works".
The 3rd-party vendor sent you the file `get_config` and told you this is a shell script to interact with your toy-srv service.

Now, your task is to write an Ansible playbook:
- Deploy the shell script to `/app/`
- Execute the shell script
- Get the output of the script by dumping as debug message

# Prepare your env
```
$ prep_env_p2_<arch>
```

# Submission
- Submit your playbook yaml and name it as `prob2_playbook.yaml`
- Run your playbook `ansible-playbook <path_to>/prob2_playbook.yaml` and submit two iteration of results:

    ```
    $ ansible-playbook -v <path_to>/prob2_playbook.yaml > prob2_first_run.txt
    $ ansible-playbook -v <path_to>/prob2_playbook.yaml > prob2_second_run.txt
    ```
- Make sure the .txt files are generated with verbose flag `-v`
- Submit a plaintext file `reasoning.txt` to briefly explain your playbook:
    - If you use some non-default parameters, why?
    - Any trouble when you do this task? If so, how did you address them?

# Hint
- Please honor the constraint to NOT modify the content of the script file
- We expect the servers are in the state after prob1. You do not need to replicate the tasks from prob1_playbook.yaml
