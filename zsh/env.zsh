# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH=/Users/lsli/.oh-my-zsh

# Some Environment Variable
export RANGER_LOAD_DEFAULT_RC=False
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR=nvim
export TERM=xterm-256color
export SHELL=/bin/zsh
export PATH=/Users/lsli/software/hdf5-1.12.0/bin:/Users/lsli/anaconda3/envs/underworld-pip/bin:/Users/lsli/software/openmpi-4.1.1/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/Apple/usr/bin
export PYTHONPATH=:/Users/lsli/anaconda3:/Users/lsli/anaconda3:/Users/lsli/anaconda3:/Users/lsli/anaconda3:/Users/lsli/anaconda3:/Users/lsli/anaconda3:/Users/lsli/software/petsc-3.15.0/lib:/Users/lsli/software/underworld-2.11
if [[ "$(uname -s)" == "Linux" ]]; then BREW_TYPE="linuxbrew"; else BREW_TYPE="homebrew"; fi


# Network conf
export http_proxy="http://127.0.0.1:8001"
export HTTP_PROXY="http://127.0.0.1:8001" 
export DYLD_LIBRARY_PATH=/usr/local/Cellar/hwloc/2.4.1/lib

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/lsli/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/lsli/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/lsli/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/lsli/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#export HOMEBREW_BREW_GIT_REMOTE=https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
#export HOMEBREW_CORE_GIT_REMOTE=https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/bottle
#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.nju.edu.cn/homebrew-bottles

export HOMEBREW_NO_AUTO_UPDATE=true
export PATH=/usr/local/bin:$PATH
export CPLUS_INCLUDE_PATH=/Volumes/AppleExternal.nosync/download/boost

export DYLD_LIBRARY_PATH=/Volumes/AppleExternal.nosync/download/boost:DYLD_LIBRARY_PATH
export PATH="/usr/local/opt/ruby/bin":$PATH
export PATH="$HOME/.config/nvim/plugged/zotcite/python3":$PATH
export PANDOC_DIR="/Users/lsli/.pandoc"
export PATH="$PANDOC_DIR/filters":$PATH
export PATH="$HOME/Scripts":$PATH
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export PATH="$HOME/.local/bin":$PATH
