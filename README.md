# tfe_scripts_apply_gather_output
A script that uses the TFE API to perform Run operation

# Prerequisites

- Terraform Enterprise account [Link](app.terraform.io)
- A user token for Terraform Enterprise 
- Vagrant installed [Link](https://www.vagrantup.com/downloads.html)

# TO-DO

- Create script that retrieves output produced by TFE apply
- Update README.md with instructions how to use this repository


# DONE

- Create a ```Vagrantfile```
- Create a provisioning script that installs ```curl``` and ```jq```
- Create a script ```run_plan_apply.sh```
- Add line that finds your workspace ID 
- Add line that finds your current_run ID
- Add line that finds your configuration ID
- Create a payload file (payload.json)
- Add line that creates a new run
- Add a line that applies the new run

# How to use this repository

- Clone the repository

```
git clone https://github.com/firedot/tfe_scripts_apply_gather_output.git
```

- Go in the cloned repository directory

```
cd tfe_scripts_apply_gather_output
```

- Run the following command to spin-up the virtual machine with Vagrant

```
vagrant up
```

- After the machine is done loading, connect to it via SSH by runnning the following command

```
vagrant ssh
```
- Prepare your environment for connection to the Terraform Enterprise API

```
export TOKEN=<your_API_token_here>
```

- Run the following command to perform run / plan / apply procedures automatically

```
bash /vagrant/scripts/run_plan_apply.sh <your_organization_name_here> <your_workspace_name_here>
```
If everything is successful, you should see output similar to the one below: 

![Alt text](pics/Success.png?raw=true "Success")
