# Colors
red="\e[31m"
green="\e[32m"
reset="\e[0m"
command="flake8"

for i in $(git diff --cached --name-only); do
    $command $i
    if [ $? -eq 0 ]
    then
      echo "😀 \e[1m${green}Success: Committing...${reset}"
      exit 0
    else
      echo "😪 \e[1m${red}Failure: Sorry.${reset}" >&2
      echo "${red}Command: \e[1m${command} ${reset}" >&2

      exit 1
    fi
done
