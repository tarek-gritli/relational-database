PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# if argument is empty
if [[ -z $1 ]]
then 
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    #if argument is a number then it has to be atomic_number and we should query the database based on it
    ELEMENT=$($PSQL "select * from elements e full join properties p using(atomic_number) where e.atomic_number=$1")
  else
    # argument is not a number, it is either a symbol or a name
    ELEMENT=$($PSQL "select * from elements e full join properties p using(atomic_number) where e.name='$1' or e.symbol='$1'")
  fi 
  if [[ -z $ELEMENT ]]
  then 
    #element not found in database
    echo I could not find that element in the database.
  else
    #element found
    echo "$ELEMENT" | while IFS='|' read ATOMIC_NUMBER SYMBOL NAME MASS MELTING_POINT BOILING_POINT TYPE_ID
    do
      #get type of atom
      TYPE=$($PSQL "select type from types where type_id=$TYPE_ID")
      #print informations
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi
fi