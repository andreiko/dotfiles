function goon () {
    PREFIX="${HOME}/go"
    GOPATH="${PREFIX}/$1"
    PS1="($1)$PS1"
    PATH="${GOPATH}/bin:${PATH}"
    if [ -d $GOPATH ]; then
        export GOPATH PATH PS1
        STARTDIR="${GOPATH}"
        if [ -f "${GOPATH}/.bashrc" ]; then
            . "${GOPATH}/.bashrc"
        fi
        cd $STARTDIR
    fi
}

function _goon_gopaths {
    local cur prev opts n
    cur="${COMP_WORDS[COMP_CWORD]}"

    COMPREPLY=()
    opts=$(ls "${HOME}/go" 2> /dev/null)

    if (( $? != 0 )); then
        return
    fi

    if (( $COMP_CWORD == 1 )); then
        COMPREPLY=( $(compgen -W "${opts[@]}" -- $cur) )
    fi
}

complete -F _goon_gopaths goon
