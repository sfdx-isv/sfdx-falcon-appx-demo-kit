#!/bin/sh
####################################################################################################
#
# FILENAME:     shared-functions.sh
#
# PURPOSE:      Common header file for all setup-tools scripts. Contains shared functions.
#
# DESCRIPTION:  Contains shared functions used by all of the setup-tools shell scripts.
#
# INSTRUCTIONS: This script should be sourced at the top of all setup-tools shell scripts.
#               DO NOT SOURCE THIS SCRIPT MANUALLY FROM THE COMMAND LINE. If you do, all of the
#               shell variables set by this script (including those from local-config.sh) will be
#               set in the user's shell, and any changes to local-config.sh may not be picked up
#               until the user manually exits their shell and opens a new one.
#
####################################################################################################
#
##
###
#### PREVENT RELOAD OF THIS LIBRARY ################################################################
###
##
#
if [ "$SFDX_FALCON_FRAMEWORK_SHELL_VARS_SET" = "true" ]; then
  # The SFDX_FALCON_FRAMEWORK_SHELL_VARS_SET variable is defined as part of 
  # this project's local configuration script (local-config.sh).  If this 
  # variable holds the string "true" then it means that local-config.sh has
  # already been sourced (loaded).  Since this is exactly what THIS script
  # (shared-functions.sh) is supposed to do it means that this library has
  # already been loaded.  
  #
  # We DO NOT want to load shared-functions.sh a second time, so we'll RETURN
  # (not EXIT) gracefully so the caller can continue as if they were the
  # first to load this.
  return 0
fi
#
##
###
#### FUNCTION: askUserForStringValue ###############################################################
###
##
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
##
###
#### FUNCTION: confirmChoice #######################################################################
###
##
#
confirmChoice () {
  # Local variable will store the user's response.
  local USER_RESPONSE=""
  # Show the question being asked.
  echo "`tput rev`$2`tput sgr0`"
  # Prompt the user for a response and read their input.
  read -p "$3" USER_RESPONSE
  # Save the user's response to the variable provided by the caller.
  eval "$1=\"$USER_RESPONSE\""
  # Add a line break
  echo ""
}
#
##
###
#### FUNCTION: confirmScriptExecution ##############################################################
###
##
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
##
###
#### FUNCTION: determineTargetOrgAlias () ##########################################################
###
##
#
determineTargetOrgAlias () {
  # Start by clearing TARGET_ORG_ALIAS so we'll know for sure if a new value was provided
  TARGET_ORG_ALIAS=""

  # If no value was provided for $REQUESTED_INSTALLATION_OPTION, set defaults and return success.
  if [ -z "$REQUESTED_INSTALLATION_OPTION" ]; then
    INSTALLATION_OPTION="NOT_SPECIFIED"
    TARGET_ORG_ALIAS="NOT_SPECIFIED"
    return 0
  else 
    case "$REQUESTED_INSTALLATION_OPTION" in 
      "DEPLOY_DEMO")
        TARGET_ORG_ALIAS="$DEMO_INSTALLATION_ORG_ALIAS"
        ;;
      "VALIDATE_DEMO")
        TARGET_ORG_ALIAS="$DEMO_VALIDATION_ORG_ALIAS"
        ;;
    esac
    # Make sure that TARGET_ORG_ALIAS was set.  If not, it means an unexpected INSTALLATION_OPTION
    # was provided.  In that case, raise an error and abort the script.
    if [ -z "$TARGET_ORG_ALIAS" ]; then
      echo "\nFATAL ERROR: `tput sgr0``tput setaf 1`$REQUESTED_INSTALLATION_OPTION is not a valid installation option.\n"
      exit 1
    fi
    # If we get this far, it means that the REQUESTED_INSTALLATION_OPTION was valid.
    # We can now assign that to the INSTALLATION_OPTION variable and return success.
    INSTALLATION_OPTION="$REQUESTED_INSTALLATION_OPTION"
    return 0
  fi
}
#
##
###
#### FUNCTION: echoConfigVariables () ##############################################################
###
##
#
echoConfigVariables () {
  echo ""
  echo "`tput setaf 7`PROJECT_ROOT ------------------->`tput sgr0` " $PROJECT_ROOT
  echo "`tput setaf 7`INSTALLATION_OPTION ------------>`tput sgr0` " $INSTALLATION_OPTION
  echo "`tput setaf 7`TARGET_ORG_ALIAS --------------->`tput sgr0` " $TARGET_ORG_ALIAS
  echo "`tput setaf 7`DEMO_ADMIN_USER ---------------->`tput sgr0` " $DEMO_ADMIN_USER
  echo "`tput setaf 7`DEMO_PRIMARY_USER -------------->`tput sgr0` " $DEMO_PRIMARY_USER
  echo "`tput setaf 7`DEMO_SECONDARY_USER ------------>`tput sgr0` " $DEMO_SECONDARY_USER
  echo "`tput setaf 7`DEMO_VALIDATION_ORG_ALIAS ------>`tput sgr0` " $DEMO_VALIDATION_ORG_ALIAS
  echo "`tput setaf 7`DEMO_INSTALLATION_ORG_ALIAS ---->`tput sgr0` " $DEMO_INSTALLATION_ORG_ALIAS
  echo "`tput setaf 7`DEMO_PACKAGE_VERSION_ID_01 ----->`tput sgr0` " $DEMO_PACKAGE_VERSION_ID_01
  echo "`tput setaf 7`DEMO_PACKAGE_VERSION_ID_02 ----->`tput sgr0` " $DEMO_PACKAGE_VERSION_ID_02
  echo "`tput setaf 7`DEMO_PACKAGE_VERSION_ID_03 ----->`tput sgr0` " $DEMO_PACKAGE_VERSION_ID_03
  echo "`tput setaf 7`DEMO_PACKAGE_VERSION_ID_04 ----->`tput sgr0` " $DEMO_PACKAGE_VERSION_ID_04
  echo "`tput setaf 7`DEMO_PACKAGE_VERSION_ID_05 ----->`tput sgr0` " $DEMO_PACKAGE_VERSION_ID_05
  echo "`tput setaf 7`GIT_REMOTE_URI ----------------->`tput sgr0` " $GIT_REMOTE_URI
  echo "`tput setaf 7`ECHO_LOCAL_CONFIG_VARS --------->`tput sgr0` " $ECHO_LOCAL_CONFIG_VARS
  echo ""
}
#
##
###
#### FUNCTION: echoErrorMsg () #####################################################################
###
##
#
echoErrorMsg () {
  tput sgr 0; tput setaf 7; tput bold;
  printf "\n\nERROR: "
  tput sgr 0; tput setaf 1;
  printf "%b\n\n" "$1"
  tput sgr 0;
}
#
##
###
#### FUNCTION: echoQuestion () #####################################################################
###
##
#
echoQuestion () {
  tput sgr 0; tput rev;
  printf "\nQuestion $CURRENT_QUESTION of $TOTAL_QUESTIONS:" 
  printf " %b\n\n" "$1"
  tput sgr 0;
  let CURRENT_QUESTION++
}
#
##
###
#### FUNCTION: echoScriptCompleteMsg () ############################################################
###
##
#
echoScriptCompleteMsg () {
  tput sgr 0; tput setaf 7; tput bold;
  printf "\n\nScript Complete: "
  tput sgr 0;
  printf "%b\n\n" "$1"
  tput sgr 0;
}
#
##
###
#### FUNCTION: echoStepMsg () ######################################################################
###
##
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
##
###
#### FUNCTION: echoWarningMsg () ###################################################################
###
##
#
echoWarningMsg () {
  tput sgr 0; tput setaf 7; tput bold;
  printf "\n\nWARNING: "
  tput sgr 0;
  printf "%b\n\n" "$1"
  tput sgr 0;
}
#
##
###
#### FUNCTION: findProjectRoot () ##################################################################
###
##
#
findProjectRoot () {
  # Detect the path to the directory that the running script was called from.
  local PATH_TO_RUNNING_SCRIPT="$( cd "$(dirname "$0")" ; pwd -P )"

  # Grab the last 12 characters of the detected path.  This should be "/setup-tools".
  local DEV_TOOLS_SLICE=${PATH_TO_RUNNING_SCRIPT: -12}

  # Make sure the last 12 chars of the path are "/setup-tools".  
  # Kill the script with an error if not.
  if [[ $DEV_TOOLS_SLICE != "/setup-tools" ]]; then
    echoErrorMsg "Script was not executed within the <project-root>/setup-tools directory."
    tput sgr 0; tput bold;
    echo "Shell scripts that utilize FALCON DEMO Setup Tools must be executed from inside"
    echo "the setup-tools directory found at the root of your SFDX-Falcon Demo Project.\n"
    exit 1
  fi

  # Calculate the Project Root path by going up one level from the path currently
  # held in the PATH_TO_RUNNING_SCRIPT variable
  local PATH_TO_PROJECT_ROOT="$( cd "$PATH_TO_RUNNING_SCRIPT" ; cd .. ; pwd -P )"

  # Pass the value of the "detected path" back out to the caller by setting the
  # value of the first argument provided when the function was called.
  eval "$1=\"$PATH_TO_PROJECT_ROOT\""
}
#
##
###
#### FUNCTION: initializeHelperVariables () ########################################################
###
##
#
initializeHelperVariables () {
  PROJECT_ROOT=""                                         # Path to the root of this SFDX project
  TARGET_ORG_ALIAS=""                                     # Target of all Salesforce CLI commands during this run
  LOCAL_CONFIG_FILE_NAME=setup-tools/lib/local-config.sh  # Name of the file that contains local config variables
  CURRENT_STEP=1                                          # Used by echoStepMsg() to indicate the current step
  TOTAL_STEPS=0                                           # Used by echoStepMsg() to indicate total num of steps
  CURRENT_QUESTION=1                                      # Used by echoQuestion() to indicate the current question
  TOTAL_QUESTIONS=1                                       # Used by echoQuestion() to indicate total num of questions

  # Call findProjectRoot() to dynamically determine
  # the path to the root of this SFDX project
  findProjectRoot PROJECT_ROOT
}
#
##
###
#### FUNCTION: resetQuestionCounter () #############################################################
###
##
#
resetQuestionCounter () {
  CURRENT_QUESTION=1
  TOTAL_QUESTIONS=$1
}
#
##
###
#### FUNCTION: resetStepMsgCounter () ##############################################################
###
##
#
resetStepMsgCounter () {
  CURRENT_STEP=1
  TOTAL_STEPS=$1
}
#
##
###
#### FUNCTION: showPressAnyKeyPrompt ###############################################################
###
##
#
showPressAnyKeyPrompt () {
  read -n 1 -sr -p "-- Press any Key to Continue --"
}
#
##
###
#### FUNCTION: suggestDefaultValue #################################################################
###
##
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
#### BEGIN MAIN EXECUTION BLOCK ####################################################################
###
##
#
# INITIALIZE HELPER VARIABLES
initializeHelperVariables

# CHECK IF LOCAL CONFIG SHOULD BE SUPPRESSED.
# If $SUPPRESS_LOCAL_CONFIG has been set to "true" DO NOT load the local configuration
# variables.  A script that includes shared-functions.sh can set this variable prior to
# the source command to force this behavior.
if [ "$SUPPRESS_LOCAL_CONFIG" = "true" ]; then
  # Comment out the following line unless you're debugging and need to verify suppression.
  # echo "Local setup-tools configuration (local-config.sh) has been suppressed"
  return 0
fi

# CHECK IF LOCAL CONFIG FILE EXISTS
# Look for the local config variables script local-config.sh.  If the developer has not created a
# local-config.sh file in setup-tools/lib then EXIT from the shell script with an error message. 
if [ ! -r "$PROJECT_ROOT/$LOCAL_CONFIG_FILE_NAME" ]; then
  echoErrorMsg "Local setup-tools configuration file not found"
  tput sgr 0; tput bold;
  echo "Your project does not have a local-config.sh file in your setup-tools/lib directory."
  echo "To fix this, run sfdx falcon:demo:repair inside your project directory and follow the prompts.\n"
  exit 1
fi

# LOAD THE LOCAL CONFIG VARIABLES
# The local-config.sh file was found and is readable. Source (execute) it the current shell process.
# This will make all the variables defined in local-config.sh available to all commands that come
# after it in this shell.
source "$PROJECT_ROOT/$LOCAL_CONFIG_FILE_NAME"

# DETERMINE THE TARGET ORG ALIAS
# This function must be run AFTER the local config variables have been sourced because 
# it relies on the fact that certain Org Alias values will already be set and available.
determineTargetOrgAlias

# ECHO LOCAL CONFIG VARIABLES
# Check if ECHO_LOCAL_CONFIG_VARS varible is TRUE and display them if it is.
if [ "$ECHO_LOCAL_CONFIG_VARS" = "true" ]; then
  echo "\n`tput setaf 7``tput bold`Local configuration variables set by `dirname $0`/lib/local-config.sh`tput sgr0`\n"
  echoConfigVariables
fi

# MARK THAT LOCAL CONFIG VARIABLES HAVE BEEN SET.
# Indicates that local config variables have been successfully set. 
SFDX_FALCON_FRAMEWORK_SHELL_VARS_SET="true"


##END##