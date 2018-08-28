# SFDX-Falcon: AppExchange Demo Kit (ADK)

The AppExchange Demo Kit (ADK) allows Salesforce developers to create projects that can automatically build build rich, powerful, and complex demo orgs.    

Salesforce Administrators, Business Analysts, and others who may have stayed far away from command-line tools will be able to clone and build your ADK project by typing just one line at the command prompt.  

PLACEHOLDER FOR ANIMATED GIF


## Getting Started

These instructions will help you install the [SFDX-Falcon CLI Plugin](https://www.npmjs.com/package/sfdx-falcon), clone an AppExchange Demo Kit (ADK) starter project, distribute your first ADK project to others.  

If your environment already meets all the prerequisites, following this Getting Started guide should only take 10-15 minutes.


## Prerequisites
Before getting started, please make your Salesforce, GitHub, and Local environments meet [these prerequisites](PREREQS.md).


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


## Step Four: Use the SFDX-Falcon CLI Plugin to Create an ADK Project

Start the AppExchange Demo Kit project setup wizard by executing `falcon:demo:create` from the command line.

```
$ sfdx falcon:demo:create
```

You should see something similar to this:

![Run falcon:demo:create from the CLI](https://drive.google.com/uc?export=view&id=1hBeJZ3uCpK0mCFNuIbkW4j7dbeUoOdHz)

1. Run `sfdx falcon:demo:create` from the command line
2. The SFDX-Falcon plugin will take 1-2 minutes to initialize the AppExchange Demo Kit project wizard
3. Answer the questions presented to you by the wizard
    *  **IMPORTANT:** For the question "What is the URI of your Git Remote?", paste the https URL you copied from GitHub in Step Three.
4. Review the information you provided to the wizard
5. Confirm that you want to create a new ADK project using these settings


## Step Five: Run a Test Build

Content TBD

```
$ cd uc-demo-app
$ sfdx falcon:demo:install
```


## Step Six: Push Your ADK Project to GitHub

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

SFDX-Falcon and the AppExchange Demo Kit (ADK) are made available under the MIT License - see the [LICENSE](LICENSE) file for details.