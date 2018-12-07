#!/bin/bash

# ============================================================================
# Definition of used constants
#
# Creation: 2018-12-07 HLXEasy
# ============================================================================

# Dialog exit status codes
DIALOG_OK=0
DIALOG_CANCEL=1
DIALOG_HELP=2
DIALOG_EXTRA=3
DIALOG_ITEM_HELP=4
DIALOG_ESC=255
DIALOG_ERROR=-1

# Fields on transaction array (RPC listtransactions)
TA_ACCOUNT=0
TA_ADDRESS=1
TA_AMOUNT=2
TA_BLOCKHASH=3
TA_BLOCKINDEX=4
TA_BLOCKTIME=5
TA_CATEGORY=6
TA_CONFIRMATIONS=7
TA_CURRENCY=8
TA_GENERATED=9
TA_NARRATION=10
TA_TIME=11
TA_TIMERECEIVED=12
TA_TXID=13
TA_VERSION=14

# Fields on wallet info (RPC getinfo)
WALLET_VERSION=0
WALLET_BALANCE_XSPEC=1
WALLET_BALANCE_SPECTRE=2
WALLET_STAKE=3
WALLET_CONNECTIONS=4
WALLET_DATARECEIVED=5
WALLET_DATASENT=6
WALLET_IP=7
WALLET_UNLOCKED_UNTIL=8
WALLET_ERRORS=9
WALLET_MODE=10
WALLET_STATE=11
WALLET_PROTOCOLVERSION=12
WALLET_WALLETVERSION=13
WALLET_NEWMINT=14
WALLET_RESERVE=15
WALLET_BLOCKS=16
WALLET_TIMEOFFSET=17
WALLET_MONEYSUPPLY=18
WALLET_SPECTRESUPPLY=19
WALLET_PROXY=20
WALLET_PROOF_OF_WORK=21
WALLET_PROOF_OF_STAKE=22
WALLET_TESTNET=23
WALLET_KEYPOOLSIZE=24
WALLET_PAYTXFEE=25
WALLET_MININPUT=26
