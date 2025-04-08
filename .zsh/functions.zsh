#!/bin/bash

# Add Ghostty's terminfo entry to remote server
# See: https://ghostty.org/docs/help/terminfo#ssh
function setup_ghost_ssh () {
  if [ -z "$1" ]; then
    echo "Syntax is 'setup_ghost_ssh <ssh server>'"
    return
  fi

  infocmp -x | ssh $1 -- tic -x -
}
