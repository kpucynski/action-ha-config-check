#!/bin/sh -el

if [ -z "$CONFIG_PATH" ]; then
  CONFIG="$GITHUB_WORKSPACE"
else
  CONFIG="$CONFIG_PATH"
fi

hass -c "$CONFIG" --script check_config "$HASS_EXTRA_ARGS"
