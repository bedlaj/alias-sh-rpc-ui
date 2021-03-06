#!/bin/bash
# ============================================================================
#
# This is a component of the Aliaswallet shell rpc ui
#
# SPDX-FileCopyrightText: © 2020 Alias Developers
# SPDX-FileCopyrightText: © 2016 SpectreCoin Developers
# SPDX-License-Identifier: MIT
#
# Author: 2018 HLXEasy
#
# ============================================================================

# ============================================================================
# Set global variables for text output(i.e. for main menu).
#
# Interpret embedded "\Z" sequences in the dialog text by the following character,
# which tells dialog to set colors or video attributes: 0 through 7 are the ANSI
# used in curses: black, red, green, yellow, blue, magenta, cyan and white respectively.
# Bold is set by 'b', reset by 'B'.
# Reverse is set by 'r', reset by 'R'.
# Underline is set by 'u', reset by 'U'.
# The settings are cumulative,
# e.g., "\Zb\Z1" makes the following text bold (perhaps bright) red.
# Restore normal settings with "\Zn".
TITLE_BACK=" Aliaswallet Bash Interface "
TITLE_TRANS=" RECENT TRANSACTIONS "
TITLE_INFO=""
TITLE_GAUGE=" Please wait "
TITLE_ERROR=" ERROR "
TITLE_SUCCESS=" Success "
TITLE_STARTING_DAEMON=" Starting Daemon - You need to wait until "
TITLE_GOODBYE=" GOODBYE "
TITLE_SEND_PUBLIC=" Send Public "
TITLE_SEND_PRIVATE=" Send Private "
TITLE_CONVERT=" Convert coins "
TITLE_USERCOMMAND=" Enter Command "
TITLE_CURL_RESULT=" cURL result "
TITLE_RECEIVE=" Wallet Addresses "
TITLE_SUGGESTION=" Suggestion "
TITLE_PLACEHOLDER_FUNCTION=" SRY "
TITLE_ENCRYPT_WALLET=" Encrypt Wallet "
TITLE_VIEW_TRANSACTIONS=" Page "
TITLE_ADV_MENU=" Advanced Options "
TITLE_WALLET_INFO=" Wallet Info "
TITLE_STAKING_INFO=" Staking Info "
TITLE_PLEASE_CHOOSE=" Please choose "
TITLE_UPDATE_BINARIES=" Update Aliaswallet "
TITLE_LANGUAGE_SELECTION=" Current language: english "
TITLE_AVAILABLE_VERSIONS=" Available versions "
TITLE_SYSTEM_STATS=" System Stats "
#
BUTTON_LABEL_ENCRYPT="Encrypt"
BUTTON_LABEL_RESTART_DAEMON="Restart daemon"
BUTTON_LABEL_ENTER="Enter"
BUTTON_LABEL_OK="OK"
BUTTON_LABEL_LEAVE="Leave"
BUTTON_LABEL_CONTINUE="Continue"
BUTTON_LABEL_PREVIOUS="Previous"
BUTTON_LABEL_NEXT="Next"
BUTTON_LABEL_SEND="Send"
BUTTON_LABEL_EXECUTE="Execute"
BUTTON_LABEL_HELP="Help"
BUTTON_LABEL_ADDRESS_BOOK="Address Book"
BUTTON_LABEL_MAIN_MENU="Main Menu"
BUTTON_LABEL_SHOW_STAKES="Show Stakes"
BUTTON_LABEL_HIDE_STAKES="Hide Stakes"
BUTTON_LABEL_JUST_LEAVE="No, just exit UI"
BUTTON_LABEL_STOP_DAEMON="Yes, stop daemon"
BUTTON_LABEL_I_HAVE_UNDERSTOOD="YES - I understand"
BUTTON_LABEL_SHOW_BALANCE="Show balance"
BUTTON_LABEL_HIDE_BALANCE="Hide balance"
BUTTON_LABEL_PUBLIC_TO_PRIVATE="Public to Private"
BUTTON_LABEL_PRIVATE_TO_PUBLIC="Private to Public"
BUTTON_LABEL_CLOSE="Close window"
BUTTON_LABEL_RETURN="Return"
BUTTON_LABEL_EXIT="Exit"
BUTTON_LABEL_UPDATE_TO_LATEST_RELEASE="Latest release"
BUTTON_LABEL_UPDATE_CHOOSE_VERSION="Choose version"
BUTTON_LABEL_REFRESH="Refresh"
BUTTON_LABEL_BACK="Back"
BUTTON_LABEL_YES="Yes"
BUTTON_LABEL_NO="No"
#
# Main Menu
CMD_MAIN_LOCK_WALLET="Lock"
EXPL_CMD_MAIN_WALLETLOCK="Lock wallet, no more staking."
CMD_MAIN_UNLOCK_WALLET="Unlock"
EXPL_CMD_MAIN_WALLETUNLOCK="Unlock wallet for staking only."
CMD_MAIN_ENCRYPT_WALLET="Encrypt"
EXPL_CMD_MAIN_WALLETENCRYPT="Encrypt wallet, provides Security."
CMD_MAIN_REFRESH="Update"
EXPL_CMD_MAIN_REFRESH="Refresh the interface."
CMD_MAIN_TRANS="Transactions"
EXPL_CMD_MAIN_VIEWTRANS="View all transactions."
CMD_MAIN_SEND="Send coins"
EXPL_CMD_MAIN_SEND="Either Public or Private."
CMD_MAIN_CONVERT_COINS="Convert coins"
EXPL_CMD_MAIN_CONVERT_COINS="Public <-> Private."
CMD_MAIN_RECEIVE="Receive"
EXPL_CMD_MAIN_RECEIVE="Show wallet addresses."
CMD_MAIN_ADVANCED_MENU="Advanced"
EXPL_CMD_MAIN_ADVANCEDMENU="Advanced Options."
CMD_MAIN_QUIT="Quit"
EXPL_CMD_MAIN_EXIT="Exit this interface."
#
# Advanced Menu
CMD_GET_SYSTEM_STATS="System"
EXPL_CMD_GET_SYSTEM_STATS_INFO="Show device info."
CMD_USER_COMMAND="Command"
EXPL_CMD_USER_COMMAND="Sending commands to daemon."
CMD_DEVELOPER_COMMAND="DevCmd"
EXPL_CMD_DEVELOPER_COMMAND="Developer mode."
CMD_CHANGE_WALLET_PW="Reencrypt"
EXPL_CMD_CHANGE_WALLET_PW="Change wallet password."
CMD_STAKING_ANALYSE="Staking"
EXPL_CMD_STAKING_ANALYSE="Get staking details."
CMD_GET_WALLET_INFO="Wallet"
EXPL_CMD_GET_WALLET_INFO="Get wallet info."
CMD_UPDATE="Update"
EXPL_CMD_UPDATE="Update Aliaswallet binaries"
CMD_VIEW_LOG="Logfile"
EXPL_CMD_VIEW_LOG="View log"
CMD_CHANGE_LANGUAGE="Language"
EXPL_CMD_CHANGE_LANGUAGE="Change Language of this UI."
CMD_GET_PEER_INFO="Peers"
EXPL_CMD_GET_PEER_INFO="Display the current peers."
CMD_MAIN_MENU="Main"
EXPL_CMD_MAIN_MENU="Go back to main menu."
#
# Error Feedback
ERROR_MAINMENU_FATAL="Unexpected fatal error in main menu dialog."
ERROR_ADVMENU_FATAL="Unexpected fatal error in advanced menu dialog."
ERROR_SYSTEM_STATS_FATAL="Unexpected fatal error in system stats dialog."
ERROR_USERCOMMAND_FATAL="Unexpected fatal error in user command dialog."
ERROR_PW_FATAL="Unexpected fatal error in password dialog."
ERROR_SEND_FATAL="Unexpected fatal error in send dialog."
ERROR_CONVERT_FATAL="Unexpected fatal error in coin conversion dialog."
ERROR_TRANS_FATAL="Unexpected fatal error in view all transactions dialog."
ERROR_GOODBYE_FATAL="Unexpected fatal error in daemon stop (goodbye) dialog."
ERROR_SEND_INVALID_ADDRESS="\Z1You entered an invalid address.\Zn\n\nA valid Public address must be in the form:\n- Beginning with \"S\"\n- Length 27-34\n- Uppercase letter \"O\", \"I\", lowercase letter \"l\", and the number \"0\" are never used to prevent visual ambiguity"
ERROR_SEND_INVALID_PRIVATE_ADDRESS="\Z1You entered an invalid address.\Zn\n\nA valid private address must be in the form:\n- Length 102 characters\n- Uppercase letter \"O\", \"I\", lowercase letter \"l\", and the number \"0\" are never used to prevent visual ambiguity"
ERROR_SEND_INVALID_AMOUNT="Amount must be a number, with:\n- greater than 0\n- max. 8 digits behind decimal point"
ERROR_CURL_MSG_PROMPT="CURL error message:"
ERROR_401_UNAUTHORIZED="Error: RPC login failed. Did you change the password without restarting the daemon? Note: You can stop the daemon with the command: wallet-stop"
ERROR_DAEMON_NO_CONNECT_FROM_REMOTE="No connection to Alias wallet daemon could be established.\nYou may need to check your config."
ERROR_DAEMON_NO_CONNECT="Daemon did not respond within 60 sec.\nNo connection to Alias wallet daemon could be established.\nYou may need to check your config."
#
# use \ for a new line - note: there will be no auto line breaking
ERROR_DAEMON_ALREADY_RUNNING="Aliaswalletd (daemon) already running!\But no connection could be established.\This means the daemon was just started."
ERROR_DAEMON_STARTING="Aliaswalletd is not running.\Starting Aliaswalletd (daemon)..."
ERROR_DAEMON_WAITING_BEGIN="Daemon needs some time to initialize.\Waiting 1 minute for the daemon..."
ERROR_DAEMON_WAITING_MSG="seconds to go..."
ERROR_DAEMON_WAITING_MSG_SUCCESS="Daemon connected.\Everythings fine."
ERROR_DAEMON_WAITING_END="All done. Starting Interface..."
#
TEXT_HEADLINE_WALLET_INFO="Wallet Info"
TEXT_BALANCE="Balance"
TEXT_CURRENCY="Public"
TEXT_CURRENCY_PRIVATE="Private"
TEXT_WALLET_STATE="Wallet"
TEXT_WALLET_HAS_NO_PW="\Z1no PW\Zn"
TEXT_WALLET_IS_UNLOCKED="\Z4unlocked\Zn"
TEXT_WALLET_IS_LOCKED="\Z1locked\Zn"
#
TEXT_HEADLINE_CLIENT_INFO="Client info"
TEXT_DAEMON_VERSION="Version"
TEXT_DAEMON_ERRORS_DURING_RUNTIME="Errors"
TEXT_DAEMON_NO_ERRORS_DURING_RUNTIME="none"
TEXT_DAEMON_IP="IP"
TEXT_DAEMON_PEERS="Peers"
TEXT_DAEMON_DOWNLOADED_DATA="Download"
TEXT_DAEMON_UPLOADED_DATA="Upload"
#
TEXT_HEADLINE_STAKING_INFO="Staking Info"
TEXT_STAKING_STATE="Staking"
TEXT_STAKING_ON="\Z4ON\Zn"
TEXT_STAKING_OFF="\Z1OFF\Zn"
TEXT_STAKING_COINS="Coins"
TEXT_MATURING_COINS="aging"
TEXT_EXP_TIME="Expected time"
TEXT_STAKING_AVAILABLE="Available"
TEXT_STAKING_STAKED="Staked"
#
TEXT_STAKE="\Z4STAKE\Zn"
TEXT_IMMATURE="\Z5IMMATURE\Zn"
TEXT_RECEIVED="\Z2RECEIVED\Zn"
TEXT_TRANSFERRED="\Z1SENDED\Zn"
TEXT_CONTRIBUTE="\Z6CONTRIBUTION\Zn"
TEXT_CONFIRMATIONS="Confirmations"
TEXT_ADDRESS="Address"
TEXT_TXID="TxID"
TEXT_NARRATION="Narration"
TEXT_FEE="Fee"
#
TEXT_CLIPBOARD_HINT="On Linux: Use \Z6[CTRL]\Zn + \Z6[SHIFT]\Zn + \Z6[V]\Zn to paste from clipboard."
TEXT_SEND_DESTINATION_ADDRESS_EXPL="Destination address"
TEXT_SEND_DESTINATION_ADDRESS="Address"
TEXT_SEND_AMOUNT_EXPL="Amount of"
TEXT_SEND_AMOUNT="Amount"
TEXT_SEND_EXPL="Enter the destination address."
TEXT_SEND_NARRATION="Narration"
#
TEXT_PW_EXPL="Enter wallet password"
TEXT_CURRENT_PW_EXPL="Enter current wallet password"
TEXT_NEW_PW1_EXPL="Enter new wallet password"
TEXT_NEW_PW2_EXPL="Enter new password again"
TEXT_NO_PASS_GIVEN="No password given"
TEXT_NO_NEW_PASS_GIVEN="No new password given"
TEXT_NEW_PASS_NOT_EQUAL="New passwords do not match"
TEXT_PASS_CHANGE_SUCCESSFUL="Passphrase change successfully executed"
TEXT_WALLET_ENCRYPTION_SUCCESSFUL="Wallet successfully encrypted. Restarting daemon..."
#
TEXT_USERCOMMAND_EXPL="Here you can enter commands that will be send to the Daemon."
TEXT_USERCOMMAND_CMD_EXPL="type help for info"
TEXT_USERCOMMAND_CMD="Command"
TEXT_USERCOMMAND_PARAMS_EXPL="seperated by spaces"
TEXT_USERCOMMAND_PARAMS="Parameter"
TEXT_USERCOMMAND_AMOUNT="Amount"
#
TEXT_SYSTEM="System"
TEXT_MAX_FREQENCY="Max. Frequency"
TEXT_THRESHOLD="Threshold"
TEXT_TEMPERATURE="Temperature"
TEXT_SD_CARD="SD Card"
TEXT_FREE_DISK_SPACE="Available free disk space"
TEXT_FREE_RAM="Available free RAM"
TEXT_OS="Operating System"
TEXT_KERNEL="Linux Kernel Version"
TEXT_SWAP_DISABLED="Swapping is disabled."
TEXT_SWAP_SIZE="Swap Size"
#
TEXT_GAUGE_ALLDONE="All done."
TEXT_GAUGE_DEFAULT="Getting data from daemon..."
TEXT_GAUGE_GET_INFO="Getting general info data from daemon..."
TEXT_GAUGE_PROCESS_INFO="Processing general info data..."
TEXT_GAUGE_GET_STAKING_DATA="Getting staking data from daemon..."
TEXT_GAUGE_PROCESS_STAKING_DATA="Processing staking data..."
TEXT_GAUGE_GET_TRANS="Getting transactions data from daemon..."
TEXT_GAUGE_PROCESS_TRANS="Processing transactions data..."
#
TEXT_GOODBYE_WARNING="\Z1If you plan to shutdown the system, daemon must be stopped before to prevent database inconsistencies!\Zn\n\nDo you want to stop the daemon (no more staking) or just exit the UI?\Zn"
TEXT_GOODBYE_DAEMON_STILL_RUNNING="Daemon is still running."
TEXT_GOODBYE_DAEMON_STOPPED="Daemon stopped."
TEXT_GOODBYE_FEEDBACK="Any feedback appreciated, please let us know. Thank you!"
TEXT_GOODBYE_DAEMON_NOT_SYNCED="The Alias wallet daemon is still not fully synced.\n\nGo back and show log output or exit to cmdline?"
#
TEXT_LOGFILE_HEADER="The daemon is in sync if you see \Z1'height='\Zn followed by the current chain height on the log output below. Please be patient, this will take a while! Scroll left/right with cursor keys."
#
TEXT_FEEDBACK_WALLET_LOCKED="Wallet successfully locked.\n\n\Z5You will not be able to stake anymore.\Zn\n\nUse \Z4${CMD_MAIN_UNLOCK_WALLET}\Zn in main menu to unlock the wallet for staking only again."
TEXT_FEEDBACK_WALLET_UNLOCKED="Wallet successfully unlocked."
TEXT_SUGGESTION_STAKING="It will take a short amount of time for the daemon to update the staking status, after the wallet was unlocked/locked.\nUse the \Z4${CMD_MAIN_REFRESH}\Zn command in main menu to refresh the screen."
TEXT_FEEDBACK_RECEIVE="Press return to continue to main menu."
TEXT_DEFAULT_PUBLIC_ADDRESS="Default Public address"
TEXT_DEFAULT_PRIVATE_ADDRESS="Default Private address"
#
TEXT_SEND_UNLOCK_WALLET_AGAIN="Notice\nPlease note:\nYou have to 'unlock' the wallet for staking again.\n"
TEXT_SUGGESTION_TO_INCREASE_TERMINAL_SIZE="\nIncrease the terminal size to at least"
TEXT_PLACEHOLDER_FUNCTION="\nUnder construction...\n\nSry right now this is a placeholder."
#
TEXT_ESTIMATIONS="Estimations"
TEXT_ONE_MONTH="one month"
TEXT_HALF_YEAR="half a year"
TEXT_ONE_YEAR="one year"
TEXT_TWO_YEARS="two years"
TEXT_THREE_YEARS="three years"
TEXT_FOUR_YEARS="four years"
TEXT_FIVE_YEARS="five years"
TEXT_STAKING_ANALYSIS_TIMEFRAME="Estimation time frame"
TEXT_STAKING_ANALYSIS_LAST_THOUSAND="Within last 1000 transactions"
TEXT_STAKING_ANALYSIS_AMOUNTS="Staking transactions"
TEXT_STAKING_ANALYSIS_TOTAL_REWARD="Total reward"
TEXT_STAKING_ANALYSIS_TOTAL_TODAY="Total coins"
TEXT_STAKING_ANALYSIS_REWARD_PER_YEAR="- Staking reward rate per year"
TEXT_STAKING_ANALYSIS_COINS_IN_ONE_MONTH="- Total coins in one month"
TEXT_STAKING_ANALYSIS_STAKED_COINS_IN="- Staked coins in"
TEXT_STAKING_ANALYSIS_TOTAL_COINS_IN="- Total coins in"
#
TEXT_COIN_TYPE_TO_SEND_QUESTION="\nWhich coin type do you want to send?"
TEXT_CONVERSION_QUESTION="\nIn which direction do you want to convert?"
TEXT_AMOUNT_TO_CONVERT="Amount to convert"
#
TEXT_QUESTION_DO_UPDATE="Update Aliaswallet binaries?\nAliaswallet daemon will be stopped!\n"
TEXT_UPDATE_CANCELED="Update canceled"
TEXT_UPDATE_CHOOSE_VERSION_HINT="Please select desired version with space:"
#
TEXT_CHOOSE_LANGUAGE="Choose a language"
TEXT_CHOOSE_LANGUAGE_CANCELED="Language switch canceled"
#
TEXT_USE_AT_YOUR_OWN_RISC="                   Use at your own risk!\n\n"
#
TEXT_BOOTSTRAPPING="Installation of bootstrap chain running, please wait..."
TEXT_ALIAS_SERVICE_NOT_ENABLED="The Alias wallet service is not enabled, so it will not be started after next reboot. Enable the service now?"
