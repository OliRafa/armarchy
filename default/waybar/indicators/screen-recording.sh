#!/bin/bash

# Mirrors bin/omarchy-capture-screenrecording's recorder_process_name():
# prefer wf-recorder on aarch64 or inside VMs (no GPU hardware encoding
# available), but fall back to gpu-screen-recorder when wf-recorder isn't
# installed (e.g. x86 VMware where the package strategy ships gsr).
recorder_process_name() {
  if { [[ $(uname -m) == "aarch64" ]] || systemd-detect-virt -q; } && command -v wf-recorder &>/dev/null; then
    echo "wf-recorder"
  else
    echo "gpu-screen-recorder"
  fi
}

if pgrep -f "^$(recorder_process_name)" >/dev/null; then
  echo '{"text": "󰻂", "tooltip": "Stop recording", "class": "active"}'
else
  echo '{"text": ""}'
fi
