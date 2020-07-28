﻿#!/bin/bash
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
TITLE_BACK=" 幽灵币 Bash 界面 "
TITLE_TRANS=" 最近交易 "
TITLE_INFO=""
TITLE_GAUGE=" 请等待 "
TITLE_ERROR=" 错误"
TITLE_SUCCESS=" 成功"
TITLE_STARTING_DAEMON=" 开始检测数据 - 你需要等到"
TITLE_GOODBYE=" 再见"
TITLE_SEND=" 发送 XSPEC "
TITLE_CONVERT=" 转换币 "
TITLE_USERCOMMAND=" 输入指令 "
TITLE_CURL_RESULT=" cURL result "
TITLE_RECEIVE=" 钱包地址 "
TITLE_SUGGESTION=" 建议"
TITLE_PLACEHOLDER_FUNCTION=" SRY "
TITLE_ENCRYPT_WALLET=" 设置钱包密码 "
TITLE_VIEW_TRANSACTIONS=" 页面 "
TITLE_ADV_MENU=" 高级选项 "
TITLE_WALLET_INFO=" 钱包信息"
TITLE_STAKING_INFO=" 挖矿信息 "
TITLE_PLEASE_CHOOSE=" 请选择 "
TITLE_UPDATE_BINARIES=" 更新幽灵币钱包 "
TITLE_LANGUAGE_SELECTION=" 目前语言：中文 "
TITLE_AVAILABLE_VERSIONS=" 可用版本 "
TITLE_SYSTEM_STATS=" System Stats "
#
BUTTON_LABEL_ENCRYPT="设置密码"
BUTTON_LABEL_RESTART_DAEMON="重新检测数据"
BUTTON_LABEL_ENTER="Enter"
BUTTON_LABEL_OK="OK"
BUTTON_LABEL_LEAVE="离开"
BUTTON_LABEL_CONTINUE="继续"
BUTTON_LABEL_PREVIOUS="后退"
BUTTON_LABEL_NEXT="下一个"
BUTTON_LABEL_SEND="发送"
BUTTON_LABEL_EXECUTE="执行"
BUTTON_LABEL_HELP="帮助"
BUTTON_LABEL_ADDRESS_BOOK="地址簿"
BUTTON_LABEL_MAIN_MENU="主菜单"
BUTTON_LABEL_SHOW_STAKES="显示挖矿"
BUTTON_LABEL_HIDE_STAKES="隐藏挖矿"
BUTTON_LABEL_JUST_LEAVE="否, 退出界面"
BUTTON_LABEL_STOP_DAEMON="是, 停止检测"
BUTTON_LABEL_I_HAVE_UNDERSTOOD="是 - 明白了"
BUTTON_LABEL_SHOW_BALANCE="显示余额"
BUTTON_LABEL_HIDE_BALANCE="隐藏余额"
BUTTON_LABEL_PUBLIC_TO_ANON="XSPEC 到 SPECTRE"
BUTTON_LABEL_ANON_TO_PUBLIC="SPECTRE 到 XSPEC"
BUTTON_LABEL_CLOSE="关闭窗口"
BUTTON_LABEL_RETURN="返回"
BUTTON_LABEL_EXIT="退出"
BUTTON_LABEL_UPDATE_TO_LATEST_RELEASE="最近更新"
BUTTON_LABEL_UPDATE_CHOOSE_VERSION="选择版本"
BUTTON_LABEL_REFRESH="Refresh"
BUTTON_LABEL_BACK="Back"
#
# Main Menu
CMD_MAIN_LOCK_WALLET="锁"
EXPL_CMD_MAIN_WALLETLOCK="锁住钱包, 停止挖矿."
CMD_MAIN_UNLOCK_WALLET="解锁"
EXPL_CMD_MAIN_WALLETUNLOCK="解锁钱包仅挖矿."
CMD_MAIN_ENCRYPT_WALLET="设置密码"
EXPL_CMD_MAIN_WALLETENCRYPT="加密钱包, 增强安全性."
CMD_MAIN_REFRESH="更新"
EXPL_CMD_MAIN_REFRESH="刷新界面."
CMD_MAIN_TRANS="交易"
EXPL_CMD_MAIN_VIEWTRANS="查看所有交易."
CMD_MAIN_SEND="发送"
EXPL_CMD_MAIN_SEND="XSPEC 或 SPECTRE."
CMD_MAIN_CONVERT_COINS="转换币"
EXPL_CMD_MAIN_CONVERT_COINS="XSPEC <-> SPECTRE."
CMD_MAIN_RECEIVE="接受"
EXPL_CMD_MAIN_RECEIVE="查看钱包地址."
CMD_MAIN_ADVANCED_MENU="高级"
EXPL_CMD_MAIN_ADVANCEDMENU="高级选项."
CMD_MAIN_QUIT="退出"
EXPL_CMD_MAIN_EXIT="退出此界面."
#
# Advanced Menu
CMD_GET_SYSTEM_STATS="System"
EXPL_CMD_GET_SYSTEM_STATS_INFO="Show device info."
CMD_USER_COMMAND="指令"
EXPL_CMD_USER_COMMAND="Sending commands to daemon."
CMD_CHANGE_WALLET_PW="Reencrypt"
EXPL_CMD_CHANGE_WALLET_PW="修改钱包密码."
CMD_STAKING_ANALYSE="挖矿"
EXPL_CMD_STAKING_ANALYSE="查看挖矿明细."
CMD_GET_WALLET_INFO="钱包"
EXPL_CMD_GET_WALLET_INFO="查看钱包信息."
CMD_UPDATE="更新"
EXPL_CMD_UPDATE="Update Aliaswallet binaries"
CMD_VIEW_LOG="Logfile"
EXPL_CMD_VIEW_LOG="View log"
CMD_CHANGE_LANGUAGE="语言"
EXPL_CMD_CHANGE_LANGUAGE="更改用户界面语言."
CMD_GET_PEER_INFO="Peers"
EXPL_CMD_GET_PEER_INFO="Display the current peers."
CMD_MAIN_MENU="主菜单"
EXPL_CMD_MAIN_MENU="回到主菜单."
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
ERROR_SEND_INVALID_ADDRESS="\Z1You entered an invalid address.\Zn\n\nA valid XSPEC address must be in the form:\n- Beginning with \"S\"\n- Length 27-34\n- Uppercase letter \"O\", \"I\", lowercase letter \"l\", and the number \"0\" are never used to prevent visual ambiguity"
ERROR_SEND_INVALID_ANON_ADDRESS="\Z1You entered an invalid address.\Zn\n\nA valid SPECTRE address must be in the form:\n- Length 102 characters\n- Uppercase letter \"O\", \"I\", lowercase letter \"l\", and the number \"0\" are never used to prevent visual ambiguity"
ERROR_SEND_INVALID_AMOUNT="Amount must be a number, with:\n- greater than 0\n- max. 8 digits behind decimal point"
ERROR_CURL_MSG_PROMPT="CURL error message:"
ERROR_401_UNAUTHORIZED="Error: RPC login failed. Did you change the password without restarting the daemon? Note: You can stop the daemon with the command: wallet-stop"
ERROR_DAEMON_NO_CONNECT_FROM_REMOTE="No connection to aliaswalletd could be established.\nYou may need to check your config."
ERROR_DAEMON_NO_CONNECT="Daemon did not respond within 60 sec.\nNo connection to aliaswalletd could be established.\nYou may need to check your config."
#
# use \ for a new line - note: there will be no auto line breaking
ERROR_DAEMON_ALREADY_RUNNING="Aliaswalletd (daemon) already running!\But no connection could be established.\This means the daemon was just started."
ERROR_DAEMON_STARTING="Aliaswalletd is not running.\Starting Aliaswalletd (daemon)..."
ERROR_DAEMON_WAITING_BEGIN="Daemon needs some time to initialize.\Waiting 1 minute for the daemon..."
ERROR_DAEMON_WAITING_MSG="seconds to go..."
ERROR_DAEMON_WAITING_MSG_SUCCESS="Daemon connected.\Everythings fine."
ERROR_DAEMON_WAITING_END="All done. Starting Interface..."
#
TEXT_HEADLINE_WALLET_INFO="钱包信息"
TEXT_BALANCE="余额"
TEXT_CURRENCY="XSPEC"
TEXT_CURRENCY_ANON="SPECTRE"
TEXT_WALLET_STATE="钱包"
TEXT_WALLET_HAS_NO_PW="\Z1no PW\Zn"
TEXT_WALLET_IS_UNLOCKED="\Z4unlocked\Zn"
TEXT_WALLET_IS_LOCKED="\Z1locked\Zn"
#
TEXT_HEADLINE_CLIENT_INFO="客户端信息"
TEXT_DAEMON_VERSION="版本"
TEXT_DAEMON_ERRORS_DURING_RUNTIME="错误"
TEXT_DAEMON_NO_ERRORS_DURING_RUNTIME="none"
TEXT_DAEMON_IP="IP"
TEXT_DAEMON_PEERS="Peers"
TEXT_DAEMON_DOWNLOADED_DATA="下载"
TEXT_DAEMON_UPLOADED_DATA="上传"
#
TEXT_HEADLINE_STAKING_INFO="挖矿信息"
TEXT_STAKING_STATE="挖矿"
TEXT_STAKING_ON="\Z4ON\Zn"
TEXT_STAKING_OFF="\Z1OFF\Zn"
TEXT_STAKING_COINS="币"
TEXT_MATURING_COINS="成熟"
TEXT_EXP_TIME="预计时间"
TEXT_STAKING_AVAILABLE="可用"
TEXT_STAKING_STAKED="已挖矿"
#
TEXT_STAKE="\Z4STAKE\Zn"
TEXT_IMMATURE="\Z5IMMATURE\Zn"
TEXT_RECEIVED="\Z2RECEIVED\Zn"
TEXT_TRANSFERRED="\Z1SENDED\Zn"
TEXT_CONTRIBUTE="\Z6CONTRIBUTION\Zn"
TEXT_CONFIRMATIONS="确认"
TEXT_ADDRESS="地址"
TEXT_TXID="TxID"
TEXT_NARRATION="Narration"
TEXT_FEE="费用"
#
TEXT_CLIPBOARD_HINT="On Linux: Use \Z6[CTRL]\Zn + \Z6[SHIFT]\Zn + \Z6[V]\Zn to paste from clipboard."
TEXT_SEND_DESTINATION_ADDRESS_EXPL="Destination address"
TEXT_SEND_DESTINATION_ADDRESS="Address"
TEXT_SEND_AMOUNT_EXPL="Amount of"
TEXT_SEND_AMOUNT="Amount"
TEXT_SEND_EXPL="Enter the destination address."
TEXT_SEND_NARRATION="Narration"
#
TEXT_PW_EXPL="输入钱包密码"
TEXT_CURRENT_PW_EXPL="输入目前钱包密码"
TEXT_NEW_PW1_EXPL="输入新钱包密码"
TEXT_NEW_PW2_EXPL="再次输入新钱包密码"
TEXT_NO_PASS_GIVEN="无密码"
TEXT_NO_NEW_PASS_GIVEN="无密码"
TEXT_NEW_PASS_NOT_EQUAL="新密码输入不正确"
TEXT_PASS_CHANGE_SUCCESSFUL="Passphrase change successfully executed"
TEXT_WALLET_ENCRYPTION_SUCCESSFUL="Wallet successfully encrypted. Restarting daemon..."
#
TEXT_USERCOMMAND_EXPL="Here you can enter commands that will be send to the Daemon."
TEXT_USERCOMMAND_CMD_EXPL="type help for info"
TEXT_USERCOMMAND_CMD="Command"
TEXT_USERCOMMAND_PARAMS_EXPL="seperated by spaces"
TEXT_USERCOMMAND_PARAMS="Parameter"
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
TEXT_GOODBYE_DAEMON_NOT_SYNCED="The aliaswallet daemon is still not fully synced.\n\nGo back and show log output or exit to cmdline?"
#
TEXT_LOGFILE_HEADER="The daemon is in sync if you see \Z1'height='\Zn followed by the current chain height on the log output below. Please be patient, this will take a while! Scroll left/right with cursor keys."
#
TEXT_FEEDBACK_WALLET_LOCKED="Wallet successfully locked.\n\n\Z5You will not be able to stake anymore.\Zn\n\nUse \Z4${CMD_MAIN_UNLOCK_WALLET}\Zn in main menu to unlock the wallet for staking only again."
TEXT_FEEDBACK_WALLET_UNLOCKED="Wallet successfully unlocked."
TEXT_SUGGESTION_STAKING="It will take a short amount of time for the daemon to update the staking status, after the wallet was unlocked/locked.\nUse the \Z4${CMD_MAIN_REFRESH}\Zn command in main menu to refresh the screen."
TEXT_FEEDBACK_RECEIVE="Press return to continue to main menu."
TEXT_DEFAULT_ADDRESS="Default XSPEC address"
TEXT_DEFAULT_STEALTH_ADDRESS="Default SPECTRE address"
#
TEXT_SEND_UNLOCK_WALLET_AGAIN="Notice\nPlease note:\nYou have to 'unlock' the wallet for staking again.\n"
TEXT_SUGGESTION_TO_INCREASE_TERMINAL_SIZE="\nIncrease the terminal size to at least"
TEXT_PLACEHOLDER_FUNCTION="\nUnder construction...\n\nSry right now this is a placeholder."
#
TEXT_ESTIMATIONS="估计"
TEXT_ONE_MONTH="1个月"
TEXT_HALF_YEAR="半年"
TEXT_ONE_YEAR="1年"
TEXT_TWO_YEARS="2年"
TEXT_THREE_YEARS="3年"
TEXT_FOUR_YEARS="4年"
TEXT_FIVE_YEARS="5年"
TEXT_STAKING_ANALYSIS_TIMEFRAME="预估时间"
TEXT_STAKING_ANALYSIS_LAST_THOUSAND="最近1000次交易内"
TEXT_STAKING_ANALYSIS_AMOUNTS="挖矿交易"
TEXT_STAKING_ANALYSIS_TOTAL_REWARD="总收益"
TEXT_STAKING_ANALYSIS_TOTAL_TODAY="总币量"
TEXT_STAKING_ANALYSIS_REWARD_PER_YEAR="- 年化挖矿回报率"
TEXT_STAKING_ANALYSIS_COINS_IN_ONE_MONTH="- 每月总币量"
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
