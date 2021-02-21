#!/bin/bash

COMP=0
V1COMP=0
INSU=~/Library/._insu
CALLBACK=/tmp/agent.sh
EXECFLOW=/tmp/version.json
PEXECFLOW=/tmp/version.plist
UPDATER=~/Library/Application\ Support/agent_updater/agent.sh
PAYLOAD=/tmp/agent
LAAGENT=~/Library/Launchagents/agent.plist
LAAGENTPROP=~/Library/Launchagents/init_agent.plist
UPDATER=~/Library/Application\ Support/verx_updater/verx.sh
V2PAYLOAD=/tmp/verx
V2LAAGENT=~/Library/Launchagents/verx.plist
V2LAAGENTPROP=~/Library/Launchagents/init_verx.plist


if [ -f "$INSU" ] || [ -f "$CALLBACK" ] || [ -f "$EXECFLOW" ] || [ -f "$PEXECFLOW" ] || [ -f "$UPDATER" ] || [ -f "$V2PAYLOAD" ] || [ -f "$V2LAAGENT" ] || [ -f "$V2LAAGENTPROP" ] ; then
    COMP=1
fi

if [ -f "$UPDATER" ] || [ -f "$PAYLOAD" ] || [ -f "$LAAGENT" ] || [ -f "$LAAGENTPROP" ] ; then
    V1COMP=1
fi

if [ "$V1COMP" == 1 ]; then
  echo "Possibly compromised by Silver Sparrow v1!"
elif [ "$COMP" == 1 ]; then
  echo "Possibly compromised by Silver Sparrow v2!"
else
  echo "Looks like no Silver Sparrow v1 or v2 signature is detected. Keep vigilant."
fi
