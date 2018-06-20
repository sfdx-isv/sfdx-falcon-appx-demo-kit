#!/bin/sh
####################################################################################################
#
# FILENAME:     shared-functions.sh
#
# PURPOSE:      Common header file for all dev-tools scripts. Contains shared functions.
#
# DESCRIPTION:  Contains shared functions used by all of the dev-tools shell scripts.
#
# INSTRUCTIONS: This script should be sourced at the top of all dev-tools shell scripts.
#               Do not source this script manually from the command line. If you do, all of the
#               shell variables set by this script (including those from local-config.sh) will be
#               set in the user's shell, and any changes to local-config.sh may not be picked up
#               until the user manually exits their shell and opens a new one.
#
#
#### PREVENT RELOAD OF THIS LIBRARY ################################################################
#
if [ "$SHARED_CONFIG_VARS_SET" = "true" ]; then
  # Key local config variables are already set, which means that the
  # shared-functions library was already loaded.  RETURN (not EXIT) gracefully
  # so the caller can continue as if they were the first to load this.
  return 0
fi
#
#### LOAD FIRST SET OF HELPER VARS #################################################################
#
LOCAL_CONFIG_FILE_NAME=lib/local-config.sh  # Name of the file that contains local config variables
CURRENT_STEP=1                              # Used by echoStepMsg() to indicate the current step
TOTAL_STEPS=0                               # Used by echoStepMsg() to indicate total num of steps
CURRENT_QUESTION=1                          # Used by echoQuestion() to indicate the current question
TOTAL_QUESTIONS=0                           # Used by echoQuestion() to indicate total num of questions
#
#### FUNCTION: echoErrorMsg () #####################################################################
#
echoErrorMsg () {
  tput sgr 0; tput setaf 7; tput bold;
  printf "\n\nERROR: "
  tput sgr 0; tput setaf 1;
  printf "%b\n\n" "$1"
  tput sgr 0;
}
#
#### FUNCTION: echoWarningMsg () ###################################################################
#
echoWarningMsg () {
  tput sgr 0; tput setaf 7; tput bold;
  printf "\n\nWARNING: "
  tput sgr 0;
  printf "%b\n\n" "$1"
  tput sgr 0;
}
#
#### FUNCTION: echoScriptCompleteMsg () ############################################################
#
echoScriptCompleteMsg () {
  tput sgr 0; tput setaf 7; tput bold;
  printf "\n\nScript Complete: "
  tput sgr 0;
  printf "%b\n\n" "$1"
  tput sgr 0;
}
#
#### FUNCTION: resetStepMsgCounter () ##############################################################
#
resetStepMsgCounter () {
  CURRENT_STEP=1
  TOTAL_STEPS=$1
}
#
#### FUNCTION: resetQuestionCounter () #############################################################
#
resetQuestionCounter () {
  CURRENT_QUESTION=1
  TOTAL_QUESTIONS=$1
}
#
#### FUNCTION: echoStepMsg () ######################################################################
#
echoStepMsg () {
  tput sgr 0; tput setaf 7; tput bold;
  printf "\nStep $CURRENT_STEP of $TOTAL_STEPS:"
  tput sgr 0;
  printf " %b\n\n" "$1"
  tput sgr 0;
  let CURRENT_STEP++
}
#
#### FUNCTION: echoQuestion () #####################################################################
#
echoQuestion () {
  tput sgr 0; tput rev;
  printf "\nQuestion $CURRENT_QUESTION of $TOTAL_QUESTIONS:" 
  printf " %b\n\n" "$1"
  tput sgr 0;
  let CURRENT_QUESTION++
}
#
#### FUNCTION: confirmScriptExecution ##############################################################
#
confirmScriptExecution () {
  echo "`tput rev`$1`tput sgr0`"
  read -p "(type YES to confirm, or hit ENTER to cancel) " CONFIRM_EXECUTION
  if [ "$CONFIRM_EXECUTION" != "YES" ]; then
    echo "\nScript aborted\n"
    exit 0
  fi
  echo ""
}
#
#### FUNCTION: askUserForStringValue ###############################################################
#
askUserForStringValue () {
  # If a second argument was provided, echo its
  # value before asking the user for input.
  if [ "$2" != "" ]; then
    echo $2 "\n"
  fi

  # Create a local variable to store the value of 
  # the variable provided by the first argument.
  eval "local LOCAL_VALUE=\$$1"

  # Create a local variable to store the default error message.
  local LOCAL_ERROR_MSG="You must provide a value at the prompt."

  # Do not allow the user to continue unless they 
  # provide a value when prompted.
  while [ "$LOCAL_VALUE" = "" ]; do
    eval "read -p \"$1: \" $1"
    eval "LOCAL_VALUE=\$$1"

    if [ "$LOCAL_VALUE" = "" ]; then
      # If the caller specified a custom error message, use it.
      if [ "$3" != "" ]; then
        eval "LOCAL_ERROR_MSG=\"$3\""
      fi
      echoErrorMsg "$LOCAL_ERROR_MSG"
    fi
  done
}
#
#### FUNCTION: suggestDefaultValue #################################################################
#
suggestDefaultValue () {
  # Make sure a value was provided for the 
  # second argument of this function.
  if [ "$2" = "" ]; then
    echoErrorMsg "You must provide two arguments to suggestDefaultValue.  Terminating script."
    exit 1
  fi

  # Create local variables to store the value of 
  # the variable provided by the first argument and the
  # value of the second argument (proposed default)
  eval "local LOCAL_VALUE=\$$1"
  eval "local LOCAL_DEFAULT=\"$2\""
  
  # Set a defualt prompt message in case one is not provided.
  local INTERNAL_USER_PROMPT="Would you like to accept the following default value?"

  # If the caller supplied a third argument, it means they want
  # a specific message to be shown before accepting the default.
  # If they did now, we will use owr own "default" message.
  if [ ! -z "$3" ]; then
    INTERNAL_USER_PROMPT="$3"
  fi

  # Show prompt and display what the default var assignment would be.
  echo $INTERNAL_USER_PROMPT
  echo "\n"$1=$LOCAL_DEFAULT"\n"

  # Ask user to confirm or reject the proposed value.
  read -p "(type YES to accept,  NO to provide a different value) " CONFIRM_EXECUTION
  if [ "$CONFIRM_EXECUTION" != "YES" ]; then
    return 1
  fi

  # Store the value from arg 2 into arg 1, basically
  # using the "default" value for the main value.
  eval "$1=\"$2\""

  return 0
}
#
##
###
#### FUNCTION: installPackage () ###################################################################
###
##
#
installPackage () {
  echoStepMsg "$3"

  # Print the time (HH:MM:SS) when the installation started.
  echo "Executing force:package:install -i $1 -p 5 -w 10 -u $TARGET_DEMO_ORG_ALIAS"
  echo "\n`tput bold`Package installation started at `date +%T``tput sgr0`\n"
  local startTime=`date +%s`

  # Perform the package installation.  If the installation fails abort the script.
  (cd $PROJECT_ROOT && exec sfdx force:package:install -i $1 -p 5 -w 10 -u $TARGET_DEMO_ORG_ALIAS)
  if [ $? -ne 0 ]; then
    echoErrorMsg "$2 could not be installed. Aborting Script."
    exit 1
  fi

  # Print the time (HH:MM:SS) when the installation completed.
  echo "\n`tput bold`Package installation completed at `date +%T``tput sgr0`"
  local endTime=`date +%s`

  # Determine the total runtime (in seconds) and show the user.
  local totalRuntime=$((endTime-startTime))
  echo "Total runtime for package installation was $totalRuntime seconds."
}
#
##
###
#### FUNCTION: assignPermset () ####################################################################
###
##
#
assignPermset () {
  # Assign permission sets to the scratch org's Admin user.
  echoStepMsg "Assign the $1 permission set to the following users: $2"
  echo \
  "Executing force:user:permset:assign \\
              --permsetname "$1" \\
              --onbehalfof \"$2\" \\
              --targetusername $TARGET_DEMO_ORG_ALIAS \\
              --loglevel error\n"
  (cd $PROJECT_ROOT && exec sfdx force:user:permset:assign \
                                  --permsetname "$1" \
                                  --onbehalfof "$2" \
                                  --targetusername $TARGET_DEMO_ORG_ALIAS \
                                  --loglevel error)
  if [ $? -ne 0 ]; then
    echoErrorMsg "Permission set assignment failed unexpectedly. Aborting Script."
    exit 1
  fi
}
#
##
###
#### FUNCTION: deployMdapiSource () ################################################################
###
##
#
deployMdapiSource () {
  echoStepMsg "Deploy $1 metadata to the $TARGET_DEMO_ORG_ALIAS demo org using the MDAPI"
  echo \
  "Executing force:mdapi:deploy \\
              --deploydir ./mdapi-source/$1 \\
              --testlevel RunLocalTests \\
              --targetusername $TARGET_DEMO_ORG_ALIAS \\
              --wait 15\n"
  (cd $PROJECT_ROOT && exec sfdx force:mdapi:deploy \
                                  --deploydir ./mdapi-source/$1 \
                                  --testlevel NoTestRun \
                                  --targetusername $TARGET_DEMO_ORG_ALIAS \
                                  --wait 15)

  if [ $? -ne 0 ]; then
    echoErrorMsg "MDAPI deploy of mdapi-source/$1 failed. Aborting Script."
    exit 1
  fi
}
#
#### FUNCTION: echoConfigVariables () ##############################################################
#
echoConfigVariables () {
  echo ""
  echo "`tput setaf 7`PROJECT_ROOT ------------------->`tput sgr0` " $PROJECT_ROOT
  echo "`tput setaf 7`SALESFORCE_PROJECT_ROOT -------->`tput sgr0` " $SALESFORCE_PROJECT_ROOT
  echo "`tput setaf 7`PARTNER_PROJECT_ROOT ----------->`tput sgr0` " $PARTNER_PROJECT_ROOT
  echo "`tput setaf 7`SALESFORCE_DEMO_ORG_ALIAS ------>`tput sgr0` " $SALESFORCE_DEMO_ORG_ALIAS
  echo "`tput setaf 7`PARTNER_DEMO_ORG_ALIAS --------->`tput sgr0` " $PARTNER_DEMO_ORG_ALIAS
  echo "`tput setaf 7`PARTNER_PACKAGE_VERSION_ID_01 -->`tput sgr0` " $PARTNER_PACKAGE_VERSION_ID_01
  echo "`tput setaf 7`PARTNER_PACKAGE_VERSION_ID_02 -->`tput sgr0` " $PARTNER_PACKAGE_VERSION_ID_02
  echo "`tput setaf 7`PARTNER_PACKAGE_VERSION_ID_03 -->`tput sgr0` " $PARTNER_PACKAGE_VERSION_ID_03
  echo "`tput setaf 7`PARTNER_PACKAGE_VERSION_ID_04 -->`tput sgr0` " $PARTNER_PACKAGE_VERSION_ID_04
  echo "`tput setaf 7`PARTNER_PACKAGE_VERSION_ID_05 -->`tput sgr0` " $PARTNER_PACKAGE_VERSION_ID_05
  echo "`tput setaf 7`GIT_REMOTE_URI ----------------->`tput sgr0` " $GIT_REMOTE_URI
  echo "`tput setaf 7`ECHO_LOCAL_CONFIG_VARS --------->`tput sgr0` " $ECHO_LOCAL_CONFIG_VARS
  echo ""
}
#
#### CHECK IF LOCAL CONFIG SHOULD BE SUPPRESSED ####################################################
#
# Check to see if $SUPPRESS_LOCAL_CONFIG has been set to "true".  If it is "true", DO NOT
# load the local configuration variables.  It's likely that this library is being loaded
# as part of a project setup script, meaning it's very likely that a local-config.sh file
# has not yet been created.
#
if [ "$SUPPRESS_LOCAL_CONFIG" = "true" ]; then
  # echo "Local dev-tools configuration has been suppressed"
  return 0
fi
#
#### LOAD PROJECT VARIABLES ########################################################################
#
# Load local configuration variables from local-config.sh.  If the developer has not created a
# local-config.sh file in the same directory where this script resides (typically "dev-tools")
# then EXIT from the shell script with an error message. 
#
if [ ! -r `dirname $0`/$LOCAL_CONFIG_FILE_NAME ]; then
  echoErrorMsg "Local setup-tools configuration file not found"
  tput sgr 0; tput bold;
  echo "Your project does not have a local-config.sh file in your setup-tools/lib"
  echo "directory.  Please log an issue in your GitHub repository for support.\n"
  exit 1
fi
#
# The local-config.sh file was found and is readable. Source (execute) it the current shell process.
# This will make all the variables defined in local-config.sh available to all commands that come
# after it in this shell.
#
source `dirname $0`/$LOCAL_CONFIG_FILE_NAME



##END##