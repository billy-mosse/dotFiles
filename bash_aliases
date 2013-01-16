custom_find()                                                                    
{                                                                                
    find . -name "*.py" -exec grep -Hni $1 {} \;                                 
}   


custom_find_js()                                                                    
{                                                                                
    find . -name "*.js" -exec grep -Hni $1 {} \;
} 

custom_find_rb()                                                                    
{                                                                                
    find . -name "*.rb" -exec grep -Hni $1 {} \;
} 

export BOLD=`tput bold`                                                          
export UNDERLINE_ON=`tput smul`                                                  
export UNDERLINE_OFF=`tput rmul`                                                 
export TEXT_BLACK=`tput setaf 0`                                                 
export TEXT_RED=`tput setaf 1`                                                   
export TEXT_GREEN=`tput setaf 2`                                                 
export TEXT_YELLOW=`tput setaf 3`                                                
export TEXT_BLUE=`tput setaf 4`                                                  
export TEXT_MAGENTA=`tput setaf 5`                                               
export TEXT_CYAN=`tput setaf 6`                                                  
export TEXT_WHITE=`tput setaf 7`                                                 
export BACKGROUND_BLACK=`tput setab 0`                                           
export BACKGROUND_RED=`tput setab 1`                                             
export BACKGROUND_GREEN=`tput setab 2`                                           
export BACKGROUND_YELLOW=`tput setab 3`                                          
export BACKGROUND_BLUE=`tput setab 4`                                            
export BACKGROUND_MAGENTA=`tput setab 5`                                         
export BACKGROUND_CYAN=`tput setab 6`                                            
export BACKGROUND_WHITE=`tput setab 7`                                           
export RESET_FORMATTING=`tput sgr0`                                              
                                                                                 
                                                                                 
# Wrapper function for Maven's mvn command.                                      
mvn-color()                                                                      
{                                                                                
    # Filter mvn output using sed                                                
    mvn $@ | sed -e "s/\(\[INFO\]\ \-.*\)/${TEXT_BLUE}${BOLD}\1/g" \             
    -e "s/\(\[INFO\]\ \[.*\)/${RESET_FORMATTING}${BOLD}\1${RESET_FORMATTING}/g" \
    -e "s/\(\[INFO\]\ BUILD SUCCESSFUL\)/${BOLD}${TEXT_GREEN}\1${RESET_FORMATTING}/g" \
    -e "s/\(\[WARNING\].*\)/${BOLD}${TEXT_YELLOW}\1${RESET_FORMATTING}/g" \      
    -e "s/\(\[ERROR\]\ BUILD FAILURE\)/${BOLD}${TEXT_RED}\1${RESET_FORMATTING}/g" \
    -e "s/\(\[ERROR\].*\)/${BOLD}${TEXT_RED}\1${RESET_FORMATTING}/g" \           
    -e "s/\(\ERROR\.*\)/${BOLD}${TEXT_RED}\1${RESET_FORMATTING}/g" \             
    -e "s/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/${BOLD}${TEXT_GREEN}Tests run: \1${RESET_FORMATTING}, Failures: ${BOLD}${TEXT_RED}\2${RESET_FORMATTING}, Errors: ${BOLD}${TEXT_RED}\3${RESET_FORMATTING}, Skipped: ${BOLD}${TEXT_YELLOW}\4${RESET_FORMATTING}/g"
                                                                                 
    # Make sure formatting is reset                                              
    echo -ne ${RESET_FORMATTING}                                                 
} 

alias pygrep=custom_find                                                         
alias jsgrep=custom_find_js
alias rbgrep=custom_find_rb
alias mvnc="mvn-color"
alias svnc="python ~/.svn-color.py"
alias idbmysql='/usr/local/Calpont/mysql/bin/mysql --defaults-file=/usr/local/Calpont/mysql/my.cnf -u root'
alias pyclean='find . -name "*.pyc" -exec rm -rf {} \;'

export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache

if [ -f ~/.bash_aliases_trabajo ]; then
    . ~/.bash_aliases_trabajo
fi
