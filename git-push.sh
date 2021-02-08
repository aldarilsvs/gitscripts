#!/bin/bash
# author: Aldaril

function printListCommit()
{
    echo " 1 fix"
    echo " 2 update"
    echo " N [enter new comment]"
    echo " Q quit"
    echo ""
}

function testGitDir()
{
    if [ ! -d ".git" ] ; then
        echo "Git not init. Nothing todo"
        exit
    fi
}

function printGitStatus()
{
    git remote -v
    git status
}

function check_executeGitPush()
{
    echo "Check git process..."

    echo git add .
    echo git commit -m "\"${timestamp} ${comment}\""
    echo git push origin master
}

function executeGitPush()
{
    echo "Start git process..."

    git add .
    git commit -m "${timestamp} ${comment}"
    git push origin master
}

function dialog()
{
    cmd=""
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    comment="fix"

    
    while [ "${cmd}" = "" ]
    do
        printListCommit

        read -p "Choose comment: [1] " -e -t 60 cmd
        printf "\n"
        
        case "${cmd^^}" in
            "" | "1" ) 
                    cmd="1"
                    comment="fix"
                    newcomment=${comment}
                    ;;
                
            "2" ) 
                    comment="update"
                    newcomment=${comment}
                    ;;
                
            "N" ) 
                    read -p "Enter comment: [${timestamp} ${comment}] " -e -t 60 newcomment
                    if [ "${newcomment}" = "" ] ; then
                        echo "1"
                        newcomment=${comment}
                    fi
                    echo ""
                    ;;
                    
            "Q" ) 
                    echo "Bye."
                    exit
                    ;;
                    
            *)  
                    cmd=""
                    ;;
        esac

    done
    
    comment=${newcomment}
    
    check_executeGitPush
    
    read -p "Process?: [Yn] " -e -t 60 cmd
    printf "\n"

    if [ "${cmd^^}" != "Y" ] && [ "${cmd}" != "" ]; then
        echo "Nothing todo"
        exit
    fi

}

function main()
{
    testGitDir;
    printGitStatus;
    dialog;
    executeGitPush;
}

main $@
