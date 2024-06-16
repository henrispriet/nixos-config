#!/usr/bin/env bash

_direnv_hook() {
  local previous_exit_status=$?;
  trap -- '' SIGINT;
  eval "$("/nix/store/35klgzald67mkslqb9kkv01gn98zfbza-direnv-2.34.0/bin/direnv" export bash)";
  trap - SIGINT;
  return $previous_exit_status;
};
if [[ ";${PROMPT_COMMAND[*]:-};" != *";_direnv_hook;"* ]]; then
  if [[ "$(declare -p PROMPT_COMMAND 2>&1)" == "declare -a"* ]]; then
    PROMPT_COMMAND=(_direnv_hook "${PROMPT_COMMAND[@]}")
  else
    PROMPT_COMMAND="_direnv_hook${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
  fi
fi
