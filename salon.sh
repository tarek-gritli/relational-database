#! /bin/bash
echo -e "\n~~ Beauty Salon ~~"
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
MAIN_MENU() {
  if [[ $1 ]]
  then 
    echo -e "\n$1\n"
  fi
  SERVICES=$($PSQL "select service_id,name from services order by service_id")
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  read SERVICE_ID_SELECTED
  SERVICE_AVAILABILITY=$($PSQL "select service_id,name from services where service_id=$SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_AVAILABILITY ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  fi
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  # get customer info
  CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER=$($PSQL "insert into customers(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    
  fi
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  CUST_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  CUST_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  SERVICE_NAME_FORMATTED=$(echo $SERVICE_NAME | sed 's/\s//g' -E)
  CUST_NAME_FORMATTED=$(echo $CUST_NAME | sed 's/\s//g' -E)
  echo -e "\nWhat time would you like your $SERVICE_NAME_FORMATTED, $CUST_NAME_FORMATTED?"
  read SERVICE_TIME
  INSERTED=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUST_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  MAIN_MENU "\nI have put you down for a $SERVICE_NAME_FORMATTED at $SERVICE_TIME, $CUST_NAME_FORMATTED."
}
MAIN_MENU "Welcome to My Salon, how can I help you?"
