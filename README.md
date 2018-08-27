# SFDX-Falcon: AppExchange Demo Kit (ADK)

The AppExchange Demo Kit (ADK) allows developers to create Demo Projects using Salesforce DX and the SFDX-Falcon CLI Plugin.  

To create ADK projects based on this template, make sure you've followed all preqrequiste steps and installed the [SFDX-Falcon Plugin for the Salesforce CLI](https://www.npmjs.com/package/sfdx-falcon). Once this is done, run `sfdx falcon:demo:create` from the command line and follow the prompts.

**Intro Video:** [Getting Started with the AppExchange Demo Kit](http://bit.ly/sfdx-flow-for-isvs-falcon-intro)


## License

SFDX-Falcon and the AppExchange Demo Kit (ADK) are made available under the MIT License - see the [LICENSE](LICENSE) file for details.


## Getting Started

These instructions will help you clone an AppExchange Demo Kit (ADK) starter project to your local machine and explain the basics of customizing the Demo Recipe and other files to create your own demo.  You'll also learn how to distribute your project to others once your ADK project is up and running.

If your environment meets all the prerequisites, setup and customization of this template should only take 5-10 minutes.


## Prerequisites

Before getting started, your Salesforce and Local environments should meet the following prerequisites.


### Salesforce Environment Prerequisites

| Prerequisite                        | Reason                                                  | More Info                              |
|:------------------------------------|:--------------------------------------------------------|:---------------------------------------|
| Access to a Developer Hub           | Required for creating scratch orgs                      | [Enable the Dev Hub in Your Org][1]    |
| Create Salesforce DX Users          | Required for developers to access your Dev Hub          | [Add Salesforce DX Users][1a]          |
| Access to a Packaging Org           | Optional if creating managed/unmanaged packages         | [Overview of Salesforce Packages][2]   |

[1]: http://bit.ly/enable-dev-hub               "Enable the Dev Hub in Your Org"
[1a]: http://bit.ly/add-sfdx-users-to-devhub    "Add Salesforce DX Users"
[2]: http://bit.ly/packaging-overview           "Overview of Packages"


### GitHub Environment Prerequisites

| Prerequisite                        | Reason                                                          | More Info                                   |
|:------------------------------------|:----------------------------------------------------------------|:--------------------------------------------|
| Create a new GitHub repository      | Required for publication / sharing of your ADK project          | [Create a GitHub Repo][3]                   |
| Invite collaborators (personal)     | Optional. Support team development with a personal account      | [Invite Collaborators (personal)][4]        |
| Invite collaborators (organization) | Optional. Support team development with an organization account | [Invite Collaborators (organization)][5]    |

[3]: http://bit.ly/create-a-github-repo                   "Create a GitHub Repo"
[4]: http://bit.ly/github-invite-personal-collaborators   "Invite Collaborators to a Personal Repo"
[5]: http://bit.ly/github-manage-organization-access      "Manage Individual Access to Organization Repository"


### Local Environment Prerequisites

| Prerequisite                        | Reason                                                  | More Info                              |
|:------------------------------------|:--------------------------------------------------------|:---------------------------------------|
| OS, developer toolset, IDE and VCS  | Required by the Salesforce CLI                          | [Salesforce DX System Requirements][6] |
| Install the Salesforce CLI          | Required by the demo installation scripts               | [Install the Salesforce CLI][7]        |

[6]: http://bit.ly/sfdx-system-requirements "Salesforce DX System Requirements"
[7]: http://bit.ly/install-salesforce-cli   "Install the Salesforce CLI"

### Important Note for Windows Users
The core functionality of the ADK is driven by the SFDX-Falcon CLI Plugin which runs cross-platform on Mac, Linux, and Windows.  There are, however, optional shell scripts provided in the `tools` directory that use syntax supported by the Bash shell (and its cohorts, like Zsh).

Windows 10 users can enable the "Windows Subsystem for Linux" feature and install the Bash shell.  There's a great walkthrough that shows you [How to Install and Use the Linux Bash Shell on Windows 10](https://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10) over at HowToGeek.com.  


## Step One: Install the SFDX-Falcon CLI Plugin

The AppExchange Demo Kit (ADK) is part of the SFDX-Falcon CLI Plugin.  Once you've completed the *local environment prerequisites* (listed above), open a terminal (command prompt) and enter the following:

```
$ sfdx plugins:install sfdx-falcon
```

You should see something similar to this:

![Install the CLI Plugin](https://drive.google.com/uc?export=view&id=1h6iUbZXc3XRJrhE-8uAy_HkqH1d57XBj)

1. The command `sfdx plugins:install` lets the Salesforce CLI know that you want to install a plugin
2. The SFDX-Falcon plugin has not been digitially signed (yet), so you will need to acknowledge the warning to continue the installation

## Step Two: Create an ADK-Projects Directory

Create a directory for your AppExchange Demo Kit (ADK) projects and change into the new directory.

```
$ cd ~
$ mkdir ADK-Projects
$ cd ADK-Projects
```

You should see something similar to this:

![Create ADK-Projects Directory](https://drive.google.com/uc?export=view&id=1QMj2C7zVmnFrfo9Y0_Kju4CnMIayIaW3)

## Step Three: Create a Public GitHub Repository

Demos built with the AppExchange Demo Kit (ADK) are distributed via GitHub, so the first step when creating a new ADK project is creating a new, empty, public repository on GitHub.

### Create a New Repository:

![Create a New Repository](https://drive.google.com/uc?export=view&id=1ENOiIj_-yfwXTGo365qgfms7QQGanWmr)


1. Go to https://github.com/new
    *  Must be logged into GitHub first
2. Choose a name for your ADK project
    *  Only letters, numbers, hyphens, and underscores are allowed
    *  Using all lowercase letters is strongly recommended
3. Add a description for your ADK project
4. Choose "Public" so your demo can be distributed to others
5. Make sure that you **do not** initialize the repository with a README, add .gitignore, or add a license.  The SFDX-Falcon plugin will create these for you.
6. Click "Create Repository".

### Copy the Git Remote URI (https only):

![Copy the Git Remote URI](https://drive.google.com/uc?export=view&id=1SQQH19xb6o_RWhnRspytSjgNBNSo1v08)

1. Click the "HTTPS" button
    *  The ADK Setup Wizard does not support Git Remote URIs that use the SSH protocol
2. The URL shown here is the Git Remote URI for your new repository
3. Click the "copy to clipboard" button to automatically copy the Git Remote URI to your clipboard


## Step Two: Use the SFDX-Falcon CLI Plugin to Create an ADK Project


```
# force:auth:web:login
# -a --SETALIAS                   Set an alias for the authenticated org
sfdx force:auth:web:login -a PartnerDemoOrg
```
IMPORTANT: If you get a new FSC 30-day Trial Org you must re-run this command to ensure that your CLI is authenticated to the correct org.


## Step Two: Install the SFDX-Falcon CLI Plugin

Click the "Clone or Download" button near the top right of this repository, then click the "Copy to Clipboard" button next to the repository URI.  You will use that URI in one of the following commands.

```
# Clone this Git Repository
git clone PASTE_THE_REPOSITORY_URI_HERE
```


## Step Three: Customize Partner-Specific Variables

The demo installation scripts included in this project are driven by variables defined in `partner-settings.sh`, `shared-settings.sh`, and `salesforce-settings.sh`. You are responsible for setting appropriate values for the following variables in the `partner-settings.sh` file.

**PARTNER_PROJECT_ROOT:** This should be the path to this project on your local machine.
```
# ISV Partner's Project Root
PARTNER_PROJECT_ROOT=~/projects/my-fsc-demo-setup-project
```

**DEMO_PACKAGE_VERSION_ID_0X:** Package Version IDs representing ALL of the packages required to demo your app. Package Version ID `01` is always required.  If your app only needs one package for your demo, leave the default value of `NOT_PRESENT` for Package Version IDs `02` through `05`.
```
# Package Version ID for the Partner's MAIN packaged app. Must begin with "04t".
DEMO_PACKAGE_VERSION_ID_01="04t000000000000"

# Package Version ID for the Partner's SECOND packaged app (if applicable). Must begin with "04t".
DEMO_PACKAGE_VERSION_ID_02="NOT_PRESENT"

# Package Version ID for the Partner's THIRD packaged app (if applicable). Must begin with "04t".
DEMO_PACKAGE_VERSION_ID_03="NOT_PRESENT"

# Package Version ID for the Partner's FOURTH packaged app (if applicable). Must begin with "04t".
DEMO_PACKAGE_VERSION_ID_04="NOT_PRESENT"

# Package Version ID for the Partner's FIFTH packaged app (if applicable). Must begin with "04t".
DEMO_PACKAGE_VERSION_ID_05="NOT_PRESENT"
```


## Step Four: Customize App, Org, and Data Configuration Metadata 

Final copy TBD.  Main point of this section is to explain that the Partner will need to provide any metadata that will be needed to customize the org, customize their app, and add demo data.

### Customize Org Configuration Metadata
Final copy TBD.

### Customize App Configuration Metadata
Final copy TBD.

### Customize Data Configuration Metadata
Final copy TBD.


## Step Five: Customize Demo Installation Scripts 

Final copy TBD.  Main point of this section is to explain which demo installation scripts the partner will need to customize and what kind of customizations are required.

### Customize Package Install Script
Final copy TBD.

### Customize Org Config Script
Final copy TBD.

### Customize App Config Script
Final copy TBD.

### Customize Data Config Script
Final copy TBD.


## Step Six: Test Each Individual Demo Installation Script

Final copy TBD.  Main point of this section is to explain how to run the individual demo installation scripts, in order, to make sure that everything works correctly.

### How to test script one...
Final copy TBD.


## Step Seven: Test the Combined Demo Installation Script

Final copy TBD.  Main point of this section is to explain how to prepare for, then run the COMBINED demo installation script.  This is the last step towards ensuring that the the Product Marketing team will have a demo that can be easily installed.


## Resources
List of resources TBA
* [?????](http://wwwgoogle.com) - ????
* [?????](http://wwwgoogle.com) - ????
* [?????](http://wwwgoogle.com) - ????


## Questions/Comments

Salesforce ISV Partners with questions/comments should join the [FSC Demo Candidate Chatter Group](http://p.force.com) in the Partner Community.  You can also reach out directly to ?????.


## License

This repository contains code licensed under the MIT License - see the [LICENSE](LICENSE) file for details.