USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
if [ $USERID -ne 0 ]
then 
    echo "ERROR : YOU MUST HAVE SUDO ACCESS TO EXCUTE THIS SCRIPT"
    exit 1 # other than 0 s
fi

dnf list installed mysql 

if [ $? -ne 0 ]
then 
    dnf install mysql -y 
    if [ $? -ne 0 ]
    then 
        echo -e "installing mysql ... $R failure" 
        exit 1
    else 
        echo -e "installing mysql ... $G success"
    fi 
else 
   echo -e "MySql is already ... $Y Installed" 

fi 

dnf list installed git 

if [ $? -ne 0 ]
then 

    dnf install git -y      
    if [ $? -ne 0]
    then 
        echo -e "installing git... $R failure"
        exit 1
    else 
        echo -e " installing git ... $G suceess"
    fi   
else 
    echo -e "git is already ... $Y installed"
fi 
