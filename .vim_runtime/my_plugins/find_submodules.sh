#!/bin/sh
# easily add all submodules to the repository using git add

for x in $(find . -type d) ; do
    if [ -d "${x}/.git" ] ; then
        echo $x
        cd "${x}"
        origin="$(git config --get remote.origin.url)"
        cd - 1>/dev/null
        git submodule add "${origin}" "${x}"
    fi
done
