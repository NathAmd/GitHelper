#!/bin/bash
# test

cd

nbr=0

# Reset
co='\033[0;0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

Ini() {
clear
echo -e "${BCyan}---------- Git Helper ${BBlue}v0.7.1${BCyan} ----------${co}"
echo -e "by: ${BCyan}styloxis${co}"
echo ""
echo ""
echo ""
echo -e "Directory: ${BBlue}"
pwd
echo -e "${co}"
if [ -d "$PWD/.git" ]
then
echo -e "${BGreen} *** VALID FOLDER *** ${co}"
else
echo -e "${BRed} *** /!\  FOLDER IS NOT VALID  /!\ *** ${co}"
fi
echo ""
echo -e "Current branch:${BBlue}"
git rev-parse --abbrev-ref HEAD
echo -e "${co}"
echo -e "[${BGreen}0${co}] -> Set directory of git folder ( If exist else clone with command [${BGreen}1${co}] )"
echo -e "[${BGreen}1${co}] -> Clone repository with ${BGreen}link${co} or ${BGreen}ssh${co}"
if [ -d "$PWD/.git" ]
then
echo -e "[${BGreen}2${co}] -> pull ( Get file on the server )"
echo -e "[${BGreen}3${co}] -> status ( Get if files changed )"
echo -e "[${BGreen}4${co}] -> commit all file ( Add ${BGreen}all${co} your modification )"
echo -e "[${BGreen}5${co}] -> push ( Send your modification on the server => ${BRed}always pull before${co} )"
echo -e "[${BRed}6${co}] -> Advance -> Auto ( pull to push step )"
echo -e "[${BRed}7${co}] -> WARNING -> Revert changement ( Good if you have file conflict )"
fi
echo ""
echo ""
echo ""
if [ -d "$PWD/.git" ]
then
echo -e "[${BGreen}8${co}] -> create branch"
echo -e "[${BGreen}9${co}] -> switch branch"
echo -e "[${BGreen}10${co}] -> merge branch"
echo -e "[${BGreen}11${co}] -> delete branch on local"
echo -e "[${BGreen}12${co}] -> delete branch on the server"
echo -e "[${BRed}13${co}] -> delete branch on local ${BRed}(FORCED)${co}"
echo -e "[${BBlue}14${co}] -> Upload branch for push with that ${BBlue}( just one time )${co} "
fi
echo ""
echo ""
echo -e "[${BGreen}99${co}] -> tuto (get all step for git)"
echo "- - - - - - - - - - - - - - -"
echo "Tap number of line command: "
echo ""
read my_var
}

CmdSetDirectory() {
if [ $my_var -eq 0 ]
then
echo "Tap directory of your repository ( Exemple: ./RepositoryName )"
read my_var
cd $my_var
pwd
fi
}

CmdCloneRepository(){
if [ $my_var -eq 1 ]
then
echo  -e "Tap ${BGreen}link${co} or ${BGreen}ssh${co}"
read my_var
git clone $my_var
echo ""
read -p "Press any key to resume ..."
fi
}

CmdPull(){
if [ $my_var -eq 2 ]
then
git fetch
git pull --all
echo ""
read -p "Press any key to resume ..."
fi
}

CmdStatus(){
if [ $my_var -eq 3 ]
then
git status
echo ""
CmdPressForPass
fi
}

CmdCommit(){
if [ $my_var -eq 4 ]
then
echo "Message of commit ?"
read my_var
echo ""
git add -A
git commit -m $my_var
echo ""
CmdPressForPass
fi
}

CmdPush(){
if [ $my_var -eq 5 ]
then
git push
echo ""
CmdPressForPass
fi
}

CmdAuto(){
if [ $my_var -eq 6 ]
then
echo -e "${BYellow}"
git fetch
git pull
git add -A
git commit -m "Auto push"
git push
echo -e "${co}"
CmdPressForPass
fi
}

CmdRestore(){
if [ $my_var -eq 7 ]
then
echo -e "${BYellow}"
git restore :/
echo -e "${co}"
CmdPressForPass
fi
}

CmdGetBranch(){
echo ""
echo "---- BRANCH LIST ----"
git branch --list
echo "---------------------"
echo ""
}

CmdBranchCreate(){
    if [ $my_var -eq 8 ]
then
echo ""
echo "tap the name of the branch for create"
echo ""
read my_var
git branch $my_var
CmdPressForPass
fi
}

CmdBranchDelete(){
    if [ $my_var -eq 11 ]
then
CmdGetBranch
echo ""
echo "tap the name of the branch for delete"
echo ""
read my_var
git branch -d $my_var
CmdPressForPass
fi
}

CmdBranchDeleteOnline(){
    if [ $my_var -eq 12 ]
then
git branch -r
echo ""
echo "tap the name of the branch for delete"
echo ""
read my_var
git push origin --delete $my_var
CmdPressForPass
fi
}

CmdBranchForceDelete(){
    if [ $my_var -eq 13 ]
then
CmdGetBranch
echo ""
echo "tap the name of the branch for delete"
echo ""
read my_var
git branch -D $my_var
CmdPressForPass
fi
}

CmdBranchSwitch(){
    if [ $my_var -eq 9 ]
then
CmdGetBranch
echo ""
echo "tap the name of the branch for switch"
echo ""
read my_var
git checkout $my_var
CmdPressForPass
fi
}

CmdBranchMerge(){
if [ $my_var -eq 10 ]
then
echo ""
echo "tap the name of the branch for merge into your current branch"
echo ""
CmdGetBranch
echo ""
read my_var
git fetch
git pull
git merge $my_var
CmdPressForPass
fi
}

CmdBranchUpload(){
if [ $my_var -eq 14 ]
then
echo ""
echo "tap the name of the branch for upload"
echo ""
CmdGetBranch
echo ""
read my_var
git push -u origin $my_var
CmdPressForPass
fi
}

CmdPressForPass(){
echo ""
echo ""
echo ""
read -p "Press any key to resume ..."
}

CmdTuto(){
if [ $my_var -eq 99 ]
then
echo -e "${BGreen} - + _ + - - - - - - [ T U T O ] - - - - - - + _ + - ${co}"
echo ""
echo ""
echo ""
echo -e "[${BGreen}Step. 1${co}] Clone repository"
echo ""
echo -e "[${BGreen}Step. 2${co}] Set folder repository"
echo ""
echo -e "[${BGreen}Step. 3${co}] pull repository"
echo ""
echo -e "[${BGreen}Step. 4${co}] get current status of changement on local"
echo ""
echo -e "[${BGreen}Step. 5${co}] commit if you make changement"
echo ""
echo -e "[${BGreen}Step. 6${co}] push on the server"
echo ""
echo ""
echo -e "${BRed} /!\ Always pull before push /!\ ${co}"
echo ""
echo -e "${BYellow} After all changement, Status => commit  ${co}"
echo ""
echo ""
echo ""
CmdPressForPass
fi
}

#CmdCheckUpdate

while [ $nbr -eq 0 ]
do


Ini

echo ""
echo "- # - # - # - # - # - # - # - # - # - # - # - # - # - # -"
echo ""

CmdSetDirectory
CmdCloneRepository
if [ -d "$PWD/.git" ]
then
CmdPull
CmdStatus
CmdCommit
CmdPush
CmdAuto
CmdRestore
CmdBranchCreate
CmdBranchDelete
CmdBranchForceDelete
CmdBranchSwitch
CmdBranchMerge
CmdBranchUpload
CmdBranchDeleteOnline
fi
CmdTuto


done
