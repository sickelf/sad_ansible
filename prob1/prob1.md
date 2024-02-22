# Problem 1
Problem 1 is a simple warmup!
On all the "fake" servers, there is a service app places in `/app/toy-srv`.
However, it may or may not be running.

Write an Ansible playbook to make sure this service is running on all servers with the following conditions:
- There should be one and only one instance of the service process running on each server
- When the service is running, it creates a config file as `/app/SRV_CONFIG`. In your playbook, validate the existence. If config file is corrupted or missing, it is acceptable to restart the service. To simplify in this emulated env, no need to kill the PID of `/app/toy-srv` when you need to restart the service. Instead, just spawn another process of `/app/toy-srv` and assume the old one will be garbage collected.

# Prepare your env
```
$ prep_env_p1_<arch>
```

# Submission
- Submit your playbook yaml and name it as `prob1_playbook.yaml`
- Run your playbook `ansible-playbook <path_to>/prob1_playbook.yaml` and submit two iteration of results:

    ```
    # Reset the env as needed
    $ prep_env_p1_<arch>
    $ ansible-playbook -v <path_to>/prob1_playbook.yaml > prob1_first_run.txt
    $ ansible-playbook -v <path_to>/prob1_playbook.yaml > prob1_second_run.txt
    ```
- Make sure the .txt files are generated with verbose flag `-v`
- Submit a plaintext file `reasoning.txt` to briefly explain your playbook:
    - If you use some non-default parameters, why?
    - Any trouble when you do this task? If so, how did you tackle them?

# Hint
- Your playbook should not hang.
