# Edge2ai installation using vagrant

## Step 1 : Initialisation

#### Linux 
  
```
wget https://raw.githubusercontent.com/bguedes/edge2ai_vagrant/main/bootstrap.sh
chmod +x bootstrap.sh
./bootstrap.sh

```

#### Windows Powershell 
  
```
Invoke-WebRequest -Uri https://raw.githubusercontent.com/bguedes/edge2ai_vagrant/main/bootstrap.sh -UseBasicParsing -OutFile bootstrap.sh
./bootstrap.sh

``` 

## Step 2 : Configure edge2ai context

Edit Vagrantfile and change those attributes :

``` 
  config.vm.provision "shell", path: "VMSetup.sh", args: [
    "default",                   #Project namespace
    "1",                         #Number of nodes
    "y",                         #Use a web server for getting links (y/n)
    "owner",                     #Owner
    "end_date",                  #End Date ddmmyyyy
    "tag",                       #Tag for aws instance
    "eu-west-1",                 #AWS region
    "aws_profile",                   #AWS profile
    "aws_access_key_id",         #AWS key id
    "aws_secret_access_key",     #AWS access key
    "web_server_admin_email",    #Web server links admin email
    "web_server_admin_password", #Web server admin password
    "7.1.7",                     #CDP Base version
    "cdp_login",                 #CDP license username
    "cdp_password"],             #CDP license password
    privileged: false
```  

**Project namespace** = namespace for your VM by default the value is 'Project namespace'<br>
**Number of nodes** = number of nodes to create by default 1<br>
**Use a web server** = Create a Web page with differents links to access different CDP Base services, by default y (yes)<br>
**Owner** = the owner name <br>
**End Date** = date when the cluster will be deleted, format is ddmmyyyy<br>
**Tag** = tag used for the aws vm <br>


## Step 3 : Create VM

``` 
  vagrant up
```  

## Step 4 : Launch Edge2ai creation 

``` 
  vagrant ssh
  
  cd cd edge2ai-workshop/setup/terraform/
  ./launch.sh <namespace>
```  

