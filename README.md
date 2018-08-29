# SFDX-Falcon: AppExchange Demo Kit (ADK)

The AppExchange Demo Kit (ADK) allows Salesforce Developers to build and share rich, dynamic demo orgs in a source-centric manner **without requiring batch files or shell scripts!**

![AppExchange Demo Kit (ADK) falcon:demo:install](https://drive.google.com/uc?export=view&id=1pHTCkPSmGHzS_FoqidyA400ys6yFV8Am)

Salesforce Administrators, Business Analysts, and anyone else who has installed the [Salesforce CLI](https://developer.salesforce.com/tools/sfdxcli) can install your entire ADK Demo with just three simple commands.

```
$ sfdx falcon:demo:clone https://github.com/VivekMChawla/adk-sample.git

$ cd adk-sample

$ sfdx falcon:demo:install
```

**Want to try for yourself?**  These instructions will help you install the [SFDX-Falcon CLI Plugin](https://www.npmjs.com/package/sfdx-falcon), clone an AppExchange Demo Kit (ADK) starter project, distribute your first ADK project to others.  

If your environment already meets all the prerequisites, following this guide should only take about 10 minutes.


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

Change into the ADK project directory that was just created for you, then run `sfdx falcon:demo:install`.`

```
$ cd uc-demo-app
$ sfdx falcon:demo:install
```


## Step Six: Push Your ADK Project to GitHub

If you supplied a valid Git Remote URI during project creation, then your local repository already has a remote it can push to (origin).

```
$ git push origin master
```


## Step Seven: Test Drive Cloning/Installing Your Demo

To see what others experience when consuming your demo, try the following

```
$ cd ..
$ sfdx falcon:demo:clone https://github.com/MyGitHubUser/my-demo.git  test-drive
$ cd test-drive
$ sfdx falcon:demo:install
```


## Questions/Comments

To report bugs or request new features, [create an issue](https://github.com/sfdx-isv/sfdx-falcon-plugin/issues) for the [SFDX-Falcon CLI Plugin](https://github.com/sfdx-isv/sfdx-falcon-plugin) which powers the AppExchange Demo Kit (ADK) and AppExchange Package Kit (APK).

Additional help is available to Salesforce ISV Partners by visiting the [SFDX-Falcon Chatter Group](http://bit.ly/sfdx-falcon-group) in the Partner Community and posting questions there.


## License

SFDX-Falcon and the AppExchange Demo Kit (ADK) are made available under the MIT License - see the [LICENSE](LICENSE) file for details.