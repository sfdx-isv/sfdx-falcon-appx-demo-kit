# Prerequisites to Working with the AppExchange Demo Kit (ADK)

To effectively use the AppExchange Demo Kit (ADK), your Salesforce, GitHub, and Local development environments must meet the following prerequisites.

**Intro Video:** [AppExchange Demo Kit Prerequisites](http://bit.ly/sfdx-flow-for-isvs-falcon-intro)


## Salesforce Environment Prerequisites

| Prerequisite                        | Reason                                                  | More Info                              |
|:------------------------------------|:--------------------------------------------------------|:---------------------------------------|
| Access to a Developer Hub           | Required for creating scratch orgs                      | [Enable the Dev Hub in Your Org][1]    |
| Create Salesforce DX Users          | Required for developers to access your Dev Hub          | [Add Salesforce DX Users][1a]          |
| Access to a Packaging Org           | Optional if creating managed/unmanaged packages         | [Overview of Salesforce Packages][2]   |

[1]: http://bit.ly/enable-dev-hub               "Enable the Dev Hub in Your Org"
[1a]: http://bit.ly/add-sfdx-users-to-devhub    "Add Salesforce DX Users"
[2]: http://bit.ly/packaging-overview           "Overview of Packages"


## Git / GitHub Environment Prerequisites

| Prerequisite                        | Reason                                                           | More Info                                   |
|:------------------------------------|:-----------------------------------------------------------------|:--------------------------------------------|
| Create a GitHub account             | Required for publication / sharing of your ADK project on GitHub | [Join GitHub (free account signup)][3]      |
| Install / configure Git locally     | Required to use Git locally and with Git remotes like GitHub     | [Set up Git][3a]                            |
| Invite collaborators (personal)     | Optional. Support team development with a personal account       | [Invite Collaborators (personal)][4]        |
| Invite collaborators (organization) | Optional. Support team development with an organization account  | [Invite Collaborators (organization)][5]    |

[3]: https://github.com/join                              "Join GitHub (free GitHub personal account)"
[3a]: https://help.github.com/articles/set-up-git         "Set up Git (from GitHub Help)"
[4]: http://bit.ly/github-invite-personal-collaborators   "Invite Collaborators to a Personal Repo"
[5]: http://bit.ly/github-manage-organization-access      "Manage Individual Access to Organization Repository"


## Local Environment Prerequisites

| Prerequisite                        | Reason                                                  | More Info                              |
|:------------------------------------|:--------------------------------------------------------|:---------------------------------------|
| OS, developer toolset, IDE and VCS  | Required by the Salesforce CLI                          | [Salesforce DX System Requirements][6] |
| Install the Salesforce CLI          | Required by the demo installation scripts               | [Install the Salesforce CLI][7]        |

[6]: http://bit.ly/sfdx-system-requirements "Salesforce DX System Requirements"
[7]: http://bit.ly/install-salesforce-cli   "Install the Salesforce CLI"


## Important Note for Windows Users
The core functionality of the ADK is driven by the SFDX-Falcon CLI Plugin which runs cross-platform on Mac, Linux, and Windows.  There are, however, optional shell scripts provided in the `tools` directory that use syntax supported by the Bash shell (and its cohorts, like Zsh).

Windows 10 users can enable the "Windows Subsystem for Linux" feature and install the Bash shell.  There's a great walkthrough that shows you [How to Install and Use the Linux Bash Shell on Windows 10](https://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10) over at HowToGeek.com.  


## License

This repository contains code licensed under the MIT License - see the [LICENSE](LICENSE) file for details.