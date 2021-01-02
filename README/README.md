## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Network Diagram](https://github.com/ConnorRyerson/Networking-Project/blob/main/README/Images/Second_diagram.PNG)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the metricbeat-filebeat-playbook.yml file may be used to install only certain pieces of it, such as Filebeat.

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly redudant, in addition to restricting access to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system metrics.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function    | IP Address | Operating System |
|----------|-------------|------------|------------------|
| -------- | ----------- | ---------- | ---------------- |
| Jump Box | Gateway     | 10.0.0.4   | Linux            |
| Web-1 VM | DVWA Server | 10.0.0.9   | Linux            |
| Web-2 VM | DVWA Server | 10.0.0.10  | Linux            |
| Web-3 VM | DVWA Server | 10.0.0.11  | Linux            |
| Elk VM   | Elk         | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
98.224.82.159

Machines within the network can only be accessed by The Jump Box.
- 104.211.38.60
- 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | 98.224.82.159        |
| Web-1 VM | No                  | 10.0.0.1             |
| Web-2 VM | No                  | 10.0.0.1             |
| Web-3 VM | No                  | 10.0.0.1             |
| Elk VM   | Yes                 | Any                  |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because automation allows for the quick configuration of multiple containers.


The playbook implements the following tasks:

- Configure elk with Docker
- Increase virtual memory
- Use more memory
- Install Docker.io
- Install Python3-pip
- Install Python Docker Module
- Download and launch a Docker Web Container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Docker ps](https://github.com/ConnorRyerson/Networking-Project/blob/main/README/Images/elk_docker_ps.PNG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:

- Web-1 10.0.0.9
- Web-2 10.0.0.10
- Web-3 10.0.0.11

We have installed the following Beats on these machines:

- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:

- Filebeat allows you to monitor and collect log files or location, you can find graphs depicting the traffic to your server, the ammount of unique connections, and the type of errors recieved by these connections. Aswell as the source IP, geolocation, and url they accessed it from.
- Metricbeat allows you to collect and analyze the metrics of your applications. Metricbeat will show Inbound and Outbound traffic, Memory usage, Disk usage, CPU usage, In and Out packetloss, and many other metrics.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the elkplaybook.yml and metricbeat-filebeat-playbook.yml file to /etc/ansible.
- Update the /etc/ansible/hosts file to include the local IP and the group name as well as the python interpreter. To specify the machine you want to Install the playbook on you need to add the group name that you entered into the hosts file into the playbook YAML file (ex. "hosts: websevers or hosts: elk")
- Run the playbook, and navigate to http://[Your.VM.Public.IP]:5601/app/kibana to check that the installation worked as expected.

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
To download the DVWA playbook the user would need to download the file to their directory with the following command.
- curl https://github.com/ConnorRyerson/Networking-Project/blob/main/README/Playbooks/DVWA_playbook.yml
- To run the playbook you would run the ansible command
- ansible-playbook DVWA_playbook.yml
- To download the elk play book run
- curl https://github.com/ConnorRyerson/Networking-Project/blob/main/README/Playbooks/elkplaybook.yml
- To run use
- ansible-playbook elkplaybook.yml
- To download metricbeat and filebeat run
- curl https://github.com/ConnorRyerson/Networking-Project/blob/main/README/Playbooks/metricbeat-filebeat-playbook.yml
- To run use
- ansible-playbook metricbeat_filebeat_playbook.yml
