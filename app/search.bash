function handle_GET_search() {

  SEARCH_TERM=${PARAMS["term"]}

  RESULT=$(mongosh db-mongodb:27017/rinhadb --quiet --eval 'db.people.find({$text: {$search: "$SEARCH_TERM" }});')

  echo $SEARCH_TERM : $RESULT

  if [ ! -z "$RESULT" ] && [ "$RESULT" != "null" ]; then
    RESPONSE=$(cat views/find.jsonr | sed "s/{{data}}/$RESULT/")
  else
    RESPONSE=$(cat views/find-not-found.jsonr)
  fi

}
