# Copyright 2020 Joseph Block <jpb@unixorn.net>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Install fzf, and enable it for command line history searching and
# file searching.

# Install fzf into ~ if it hasn't already been installed.
if [[ ! -d ~/.fzf ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
fi

# Install some default settings if user doesn't already have fzf
# settings configured.
if [[ ! -f ~/.fzf.zsh ]]; then
  cp "$(dirname $0)/fzf-settings.zsh" ~/.fzf.zsh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS='--extended'
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"

# If fd command is installed, use it instead of find
if type 'fd' > /dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f'
fi

if [[ -d ~/.fzf/man ]]; then
  export MANPATH="$MANPATH:~/.fzf/man"
fi