#!/bin/bash
# ============================================================================
#
# This is a component of the Aliaswallet shell rpc ui
#
# SPDX-FileCopyrightText: © 2020 Alias Developers
# SPDX-FileCopyrightText: © 2016 SpectreCoin Developers
# SPDX-License-Identifier: MIT
#
# Author: 2018 dave#0773@discord
#
# ============================================================================

# ============================================================================
# Gathers the data form the CURL result for the getinfo command
#
# Input:  $1  - optional var determing the text width (default: TEXTWIDTH_INFO)
#
# Operating with:  $info_global
#                  $stakinginfo_global
makeOutputInfo() {
    local _textWidth
    if [[ -z "$1" ]]; then
        _textWidth="${TEXTWIDTH_INFO}"
    else
        _textWidth="$1"
    fi

    # Wallet Info
    if [[ ${TEXTHIGHT_INFO} -ge 13 ]] ; then
        echo "${TEXT_HEADLINE_WALLET_INFO}\n"
    fi

    # Public balance
    local _balance=$(echo "scale=8 ; ${info_global[${WALLET_BALANCE_PUBLIC}]}+${info_global[${WALLET_BALANCE_UNCONF_PUBLIC}]}+${info_global[${WALLET_STAKE_PUBLIC}]}" | bc)
    if [[ ${_balance} == '.'* ]]; then
        _balance="0"${_balance}
    fi
    echo $(fillLine "${TEXT_BALANCE} ${TEXT_CURRENCY}:-_-\Z4${_balance}\Zn" \
                    "${_textWidth}")"\n"

    # Private balance
    _balance=$(echo "scale=8 ; ${info_global[${WALLET_BALANCE_PRIVATE}]}+${info_global[${WALLET_BALANCE_UNCONF_PRIVATE}]}+${info_global[${WALLET_STAKE_PRIVATE}]}" | bc)
    if [[ ${_balance} == '.'* ]]; then
        _balance="0"${_balance}
    fi
    echo $(fillLine "${TEXT_BALANCE} ${TEXT_CURRENCY_PRIVATE}:-_-\Z4${_balance}\Zn" \
                    "${_textWidth}")"\n"

    # Wallet lock state
    echo $(fillLine "${TEXT_WALLET_STATE}: ${info_global[${WALLET_UNLOCKED_UNTIL}]}-_-${TEXT_STAKING_STATE}: ${stakinginfo_global[0]}" \
                    "${_textWidth}")"\n"

    # Public staking info
    if [[ ${TEXTHIGHT_INFO} -ge 13 ]] ; then
        echo "\n${TEXT_HEADLINE_STAKING_INFO} ${TEXT_CURRENCY}\n"
    elif [[ ${TEXTHIGHT_INFO} -ge 10 ]] ; then
        echo "\n"
    fi
    # Available for staking: getStakeWeight()
    # Aging: getBalance() - getStakeWeight
    local _aging=$(echo "scale=8 ; ${info_global[${WALLET_BALANCE_PUBLIC}]}-${info_global[${WALLET_STAKE_WEIGHT_PUBLIC}]}" | bc)
    echo $(fillLine "${TEXT_STAKING_AVAILABLE}: \Z4${info_global[${WALLET_STAKE_WEIGHT_PUBLIC}]}\Zn-_-(\Z5${_aging}\Zn ${TEXT_MATURING_COINS})" \
                    "${_textWidth}")"\n"

    # Staked: getStake()
    echo "${TEXT_STAKING_STAKED}: ${info_global[${WALLET_STAKE_PUBLIC}]}\n"

    # Private staking info
    if [[ ${TEXTHIGHT_INFO} -ge 13 ]] ; then
        echo "\n${TEXT_HEADLINE_STAKING_INFO} ${TEXT_CURRENCY_PRIVATE}\n"
    elif [[ ${TEXTHIGHT_INFO} -ge 10 ]] ; then
        echo "\n"
    fi
    # Available for staking: getStakeWeight()
    # Aging: getBalance() - getStakeWeight
    _aging=$(echo "scale=8 ; ${info_global[${WALLET_BALANCE_PRIVATE}]}-${info_global[${WALLET_STAKE_WEIGHT_PRIVATE}]}" | bc)
    echo $(fillLine "${TEXT_STAKING_AVAILABLE}: \Z4${info_global[${WALLET_STAKE_WEIGHT_PRIVATE}]}\Zn-_-(\Z5${_aging}\Zn ${TEXT_MATURING_COINS})" \
                    "${_textWidth}")"\n"

    # Staked: getStake()
    echo "${TEXT_STAKING_STAKED}: ${info_global[${WALLET_STAKE_PRIVATE}]}\n"

    # Expected stake time
    echo $(fillLine "${TEXT_EXP_TIME}: ${stakinginfo_global[1]}" \
                    "${_textWidth}")"\n"

    # Client Info
    if [[ ${TEXTHIGHT_INFO} -ge 13 ]] ; then
        echo "\n${TEXT_HEADLINE_CLIENT_INFO}\n"
    elif [[ ${TEXTHIGHT_INFO} -ge 10 ]] ; then
        echo "\n"
    fi
    echo $(fillLine "${TEXT_DAEMON_VERSION}: ${info_global[${WALLET_VERSION}]%% *}-_-${TEXT_DAEMON_ERRORS_DURING_RUNTIME}: ${info_global[${WALLET_ERRORS}]}" \
                    "${_textWidth}")"\n"
    echo $(fillLine "${TEXT_DAEMON_IP}: ${info_global[${WALLET_IP}]}-_-${TEXT_DAEMON_PEERS}: ${info_global[${WALLET_CONNECTIONS}]}" \
                    "${_textWidth}")"\n"
    echo $(fillLine "${TEXT_DAEMON_DOWNLOADED_DATA}: ${info_global[${WALLET_DATARECEIVED}]}-_-${TEXT_DAEMON_UPLOADED_DATA}: ${info_global[${WALLET_DATASENT}]}" \
                    "${_textWidth}")"\n"
}
