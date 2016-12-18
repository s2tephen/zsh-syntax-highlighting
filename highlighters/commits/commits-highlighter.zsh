# -------------------------------------------------------------------------------------------------
# Copyright (c) 2010-2016 zsh-syntax-highlighting contributors
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without modification, are permitted
# provided that the following conditions are met:
#
#  * Redistributions of source code must retain the above copyright notice, this list of conditions
#    and the following disclaimer.
#  * Redistributions in binary form must reproduce the above copyright notice, this list of
#    conditions and the following disclaimer in the documentation and/or other materials provided
#    with the distribution.
#  * Neither the name of the zsh-syntax-highlighting contributors nor the names of its contributors
#    may be used to endorse or promote products derived from this software without specific prior
#    written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR
# IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
# FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
# IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
# OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# -------------------------------------------------------------------------------------------------
# -*- mode: zsh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-
# vim: ft=zsh sw=2 ts=2 et
# -------------------------------------------------------------------------------------------------


# Define default styles.
: ${ZSH_HIGHLIGHT_STYLES[commits:softlimit]:=fg=173,bold}
: ${ZSH_HIGHLIGHT_STYLES[commits:hardlimit]:=fg=red,bold}

# Whether the pattern highlighter should be called or not.
_zsh_highlight_highlighter_commits_predicate(){
  [[ $(git_current_branch) != "" && _zsh_highlight_buffer_modified ]]
}

# Pattern syntax highlighting function.
_zsh_highlight_highlighter_commits_paint(){
  setopt localoptions
  local -a match mbegin mend
  local MATCH; integer MBEGIN MEND
  if [[ "$BUFFER" =~ "^g(it)? c(ommit -)?m \"" ]]; then
    local offset=${#MATCH}-1
    if [[ "$BUFFER" =~ "\"[^\"]{73,}\"?" ]]; then
      _zsh_highlight_add_highlight $offset ${#MATCH}+$offset commits:hardlimit
    elif [[ "$BUFFER" =~ "\"[^\"]{51,72}\"?" ]]; then
      _zsh_highlight_add_highlight $offset ${#MATCH}+$offset commits:softlimit
    fi
  fi
}
