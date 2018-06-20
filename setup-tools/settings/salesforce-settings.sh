#!/bin/sh
####################################################################################################
#
# FILENAME:     salesforce-settings.sh
#
# PURPOSE:      Settings used by setup-tools scripts to assist install of partner demo apps.
#
# DESCRIPTION:  Some shell scripts in the setup-tools directory require several configuration
#               values to run correctly (eg. the path to your project's root directory or the alias
#               of the DevHub that you want to use).  Salesforce employees using these scripts
#               should ensure that these values match their local environment before running them.
#
# INSTRUCTIONS: Edit the default values in this file to meet the needs of your local environment
#               and project setup.
#
####################################################################################################
#
#
# Saleforce Demo Installer's Project Root
SALESFORCE_PROJECT_ROOT=~/FSC-QuickStart/FSC-QuickStart-2

# Alias for the Salesforce-owned demo org that the Partner's app will be installed in.
SALESFORCE_DEMO_ORG_ALIAS="SalesforceDemoOrg"

# Username for the Admin User in the Demo Org
SALESFORCE_DEMO_ORG_ADMIN_USER="vivek@vmc-fsc-trial-01.org"

# Username for the Primary Demo User in the Demo Org
SALESFORCE_DEMO_ORG_PRIMARY_USER="advisoruser.jzjovso3ncvo.joehwb4yv0ey.8fmf7fwuefu5@example.com"

# Username for the Secondary Demo User in the Demo Org
SALESFORCE_DEMO_ORG_SECONDARY_USER="integration@00d6a0000037t9huau.com"

# Indicate that local config variables have been successfully set. DO NOT MODIFY.
SALESFORCE_CONFIG_VARS_SET="true"

##END##