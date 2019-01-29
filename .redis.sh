function redis() {
    if [[ -z $1 ]]; then
        cat ~/.redis.hosts | sed 's/:/\t/'
        return
    fi

    hostname=$(grep "^$1:" ~/.redis.lst | cut -f2 -d:)
    if [[ ! -z $hostname ]]; then
        redis-cli -h $hostname
    else
        echo "not found: $1"
    fi
}

function _redis_aliases {
    local cur prev opts n
    cur="${COMP_WORDS[COMP_CWORD]}"

    COMPREPLY=()
    opts=$(cat ~/.redis.hosts | cut -f1 -d:)

    if (( $? != 0 )); then
        return
    fi

    if (( $COMP_CWORD == 1 )); then
        COMPREPLY=( $(compgen -W "${opts[@]}" -- $cur) )
    fi
}

complete -F _redis_aliases redis

