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
# Starts the daemon (aliaswalletd)
#
startDaemon() {
    if [[ "${rpcconnect}" != "127.0.0.1" ]]; then
        # UI should connect to remote daemon, which was not available.
        # Show proper error message
        local _s="Settings:\n"
              _s+="RPC USER:${rpcuser}\nRPC PW:${rpcpassword}\n"
              _s+="IP:${rpcconnect}\nPort:${rpcport}\n"
        errorHandling "${ERROR_DAEMON_NO_CONNECT_FROM_REMOTE}\n${_s}" 1
    else
        # UI should connect to local daemon, try to start it
        local _oldIFS=$IFS
        local _itemBuffer
        IFS='\\'
        if (( $(ps -ef | grep -v grep | grep aliaswalletd | wc -l) > 0 )) ; then
            for _itemBuffer in ${ERROR_DAEMON_ALREADY_RUNNING}; do
                echo "${_itemBuffer}"
            done
        else
            for _itemBuffer in ${ERROR_DAEMON_STARTING}; do
                echo "${_itemBuffer}"
            done
            sudo systemctl start aliaswalletd
        fi
        for _itemBuffer in ${ERROR_DAEMON_WAITING_BEGIN}; do
            echo "${_itemBuffer}"
        done
        local _i=60
        while [[ -z "${curl_result_global}" ]] && [[ ${_i} -gt 0 ]]; do
            viewLog
            connectToDaemon "getinfo"
            if [[ -z "${curl_result_global}" ]]; then
                dialog --no-shadow \
                    --colors \
                    --ok-label "${BUTTON_LABEL_RETURN}" \
                    --cancel-label "${BUTTON_LABEL_EXIT}" \
                    --default-button 'ok' \
                    --yesno "${TEXT_GOODBYE_DAEMON_NOT_SYNCED}" 0 0
                exit_status=$?
                case ${exit_status} in
                    ${DIALOG_CANCEL})
                        reset
                        echo ''
                        info "${TEXT_GOODBYE_FEEDBACK}"
                        echo ''
                        exit 0;;
                esac
            fi
        done
        sleep 1
        IFS=${_oldIFS}
    fi
    refreshMainMenu_DATA
}