#! /bin/bash
# PSQL variable to query the database
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

NUMBER_GUESS() {
  GUESSES=1
  # generate random number
  SECRET_NUMBER=$((RANDOM % 1001))
  echo $SECRET_NUMBER
  echo "Guess the secret number between 1 and 1000:"
  read USER_NUMBER
  while [[ $USER_NUMBER != $SECRET_NUMBER ]]
  do
    # if number input is nan
    if [[ ! $USER_NUMBER =~ ^[0-9]+$ ]]
    then
      (( GUESSES++ ))
      echo "That is not an integer, guess again:"
      read USER_NUMBER
    fi
    # if number input is greater than the secret number
    if [[ $USER_NUMBER -gt $SECRET_NUMBER ]]
    then
      (( GUESSES++ ))
      echo "It's lower than that, guess again:"
      read USER_NUMBER
    # if number input is lower than the secret number
    elif [[ $USER_NUMBER -lt $SECRET_NUMBER ]]
    then
      (( GUESSES++ ))
      echo "It's higher than that, guess again:"
      read USER_NUMBER
    fi
  done
  # win game
  echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
  # get user_id to insert game stats in games table 
  USER_ID=$($PSQL "select user_id from users where username='$1'")
  # insert game stats in games table
  INSERT_GAME_STATS=$($PSQL "insert into games(user_id,guesses) values ($USER_ID,$GUESSES)")

}

echo "Enter your username:"
read USERNAME
# check if user is already in database
CHECK_USER=$($PSQL "select username from users where username='$USERNAME'")
if [[ -z $CHECK_USER ]]
then
  # first game for user
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # insert user into users table
  INSERT_USER=$($PSQL "insert into users(username) values('$USERNAME')")
  # play game
  NUMBER_GUESS $USERNAME
else
  #user played before so get number of games he played
  GAMES_PLAYED=$($PSQL "select count(*) from games inner join users using(user_id) where username='$USERNAME'")
  #get best_game of user
  BEST_GAME=$($PSQL "select MIN(guesses) from games inner join users using(user_id) where username='$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  #play game
  NUMBER_GUESS $USERNAME
fi

