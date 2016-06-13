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
