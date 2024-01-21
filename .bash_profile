#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
alias ci="/Users/bp973/.prezi/frontend-packages/node_modules/.bin/ci"
alias bach="/Users/bp973/.prezi/frontend-packages/node_modules/.bin/bach"
