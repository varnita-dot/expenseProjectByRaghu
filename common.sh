log_message=/tmp/expense.log

download_and_extract(){
  echo inside function
  echo download $component.zip
  curl  -s -o /tmp/$component.zip https://expense-artifacts.s3.amazonaws.com/$component.zip   &&>>$log_message
  echo $?

  echo unzip $component.zip
  unzip /tmp/$component.zip  &>>$log_message
  echo $?
  echo end of function

}

extract_status(){
  if [ $? -eq 0 ]; then
    echo -e "\e[32mSUCCESS\e[0m"
    else
      echo -e "\e[31mFAILED\e[0m"
  exit 1
  fi
}