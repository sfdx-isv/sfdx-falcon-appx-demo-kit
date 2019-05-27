# SFDX-Falcon: AppExchange Demo Kit (ADK)

The **AppExchange Demo Kit (ADK)** allows Salesforce Developers to build and share rich, dynamic demo orgs in a source-centric manner without requiring batch files or shell scripts!

![AppExchange Demo Kit (ADK) falcon:adk:install](https://drive.google.com/uc?export=view&id=1pHTCkPSmGHzS_FoqidyA400ys6yFV8Am)

Anyone who has installed the [Salesforce CLI](https://developer.salesforce.com/tools/sfdxcli) and the [SFDX-Falcon Plugin](https://github.com/sfdx-isv/sfdx-falcon-plugin) can install any ADK Demo with three simple commands.

```
$ sfdx falcon:adk:clone https://github.com/VivekMChawla/adk-sample.git

$ cd adk-sample

$ sfdx falcon:adk:install
```

**Want to try for yourself?**  These instructions will help you install the [SFDX-Falcon CLI Plugin](https://www.npmjs.com/package/sfdx-falcon), clone an AppExchange Demo Kit (ADK) starter project, and distribute your first ADK project to others.  


## Step One: Install Prerequisites
Before getting started, make your Salesforce, GitHub, and Local environments meet [these prerequisites](PREREQS.md).

Once your environments meet all the prerequisites, following the rest of this guide should only take about 10 minutes.


## Step Two: Install the SFDX-Falcon Plugin

The AppExchange Demo Kit (ADK) is installed as part of [SFDX-Falcon](https://github.com/sfdx-isv/sfdx-falcon-plugin), a plugin for the [Salesforce CLI](https://developer.salesforce.com/tools/sfdxcli).  Once you've completed the prerequisites from Step One, open a terminal (command prompt) and enter the following:

```
$ sfdx plugins:install sfdx-falcon
```

**You should see something similar to this:**

![Install the CLI Plugin](https://drive.google.com/uc?export=view&id=1h6iUbZXc3XRJrhE-8uAy_HkqH1d57XBj)

**Important Notes:**
1. The command `sfdx plugins:install` pulls the plugin source code directly from the [sfdx-falcon package](https://www.npmjs.com/package/sfdx-falcon), hosted by [NPM](www.npmjs.com)
2. The SFDX-Falcon Plugin has not been digitially signed (yet), so you will need to acknowledge the warning to continue the installation


## Step Three: Create an ADK-Projects Directory

Create a directory for your AppExchange Demo Kit (ADK) projects and change into the new directory.

```
$ cd ~
$ mkdir ADK-Projects
$ cd ADK-Projects
```

You should see something similar to this:

![Create ADK-Projects Directory](https://drive.google.com/uc?export=view&id=1QMj2C7zVmnFrfo9Y0_Kju4CnMIayIaW3)

## Step Four: Create a Public GitHub Repository

Demos built with the AppExchange Demo Kit (ADK) are distributed via GitHub, so the first step when creating a new ADK project is creating a new, empty, public repository on GitHub.

### Create a New Repository:
![Create a New Repository](https://drive.google.com/uc?export=view&id=1ENOiIj_-yfwXTGo365qgfms7QQGanWmr)

**Important Notes:**
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

**Important Notes:**
1. Click the "HTTPS" button
    *  **IMPORTANT:** The ADK Setup Wizard does not support Git Remote URIs that use the SSH protocol, so you must copy the HTTPS version of your Git Remote URI
2. The URL shown here is the Git Remote URI for your new repository
3. Click the "copy to clipboard" button to automatically copy the Git Remote URI to your clipboard


## Step Five: Create a New AppExchange Demo Kit (ADK) Project

Start the AppExchange Demo Kit project setup wizard by executing `falcon:adk:create` from the command line.

```
$ sfdx falcon:adk:create
```

**You should see something similar to this:**
![Run falcon:adk:create from the CLI](https://drive.google.com/uc?export=view&id=1hBeJZ3uCpK0mCFNuIbkW4j7dbeUoOdHz)

**Important Notes:**
1. Run `sfdx falcon:adk:create` from the command line
2. The SFDX-Falcon plugin will take 1-2 minutes to initialize the AppExchange Demo Kit project wizard
3. Answer the questions presented to you by the wizard
    *  **IMPORTANT:** For the question "What is the URI of your Git Remote?", paste the https URL you copied from GitHub in Step Three.
4. Review the information you provided to the wizard
5. Confirm that you want to create a new ADK project using these settings


## Step Six: Run a Test Build

Change into the ADK project directory you just created, then run `sfdx falcon:adk:install`.  Do so by entering the following:

```
$ cd uc-demo-app
$ sfdx falcon:adk:install
```


## Step Six: Push Your ADK Project to GitHub

If you supplied a valid Git Remote URI during project creation, then your local repository already has a remote it can push to (origin).

```
$ git push origin master
```


## Step Seven: Test Drive Cloning & Installing Your Demo

To see what others experience when consuming your demo, try the following:

```
$ cd ..
$ sfdx falcon:adk:clone https://github.com/MyGitHubUser/my-demo.git  test-drive
```

After entering the above, you will go through a brief interview to determine local settings for the project you're about to clone.  Once this process is complete, enter the following:

```
$ cd test-drive
$ sfdx falcon:adk:install
```

To see the demo that you installed, open the org using the following:

```
$ sfdx force:org:open
```

## Questions/Comments

To report bugs or request new features, [create an issue](https://github.com/sfdx-isv/sfdx-falcon-plugin/issues) for the [SFDX-Falcon CLI Plugin](https://github.com/sfdx-isv/sfdx-falcon-plugin) which powers the AppExchange Demo Kit (ADK) and AppExchange Package Kit (APK).

Additional help is available to Salesforce ISV Partners by visiting the [SFDX-Falcon Chatter Group](http://bit.ly/sfdx-falcon-group) in the Partner Community and posting questions there.

## Acknowledgements

[SFDX-Falcon](https://github.com/sfdx-isv/sfdx-falcon-template), the [SFDX-Falcon Plugin](https://github.com/sfdx-isv/sfdx-falcon-plugin), and the [AppExchange Demo Kit](https://github.com/sfdx-isv/sfdx-falcon-appx-demo-kit) were created by **Vivek M. Chawla** [LinkedIn](https://www.linkedin.com/in/vivekmchawla/) | [Twitter](https://twitter.com/VivekMChawla).

## License

SFDX-Falcon and the AppExchange Demo Kit (ADK) are made available under the MIT License - see the [LICENSE](LICENSE) file for details.
