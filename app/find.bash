function handle_GET_find() {

  ID=${PARAMS["id"]}

  RESULT=$(mongosh db-mongodb:27017/rinhadb --quiet --eval 'db.people.findOne({ _id: ObjectId("$ID")})'  )

  echo $ID : $RESULT

  if [ ! -z "$RESULT" ] && [ "$RESULT" != "null" ]; then
    RESPONSE=$(cat views/find.jsonr | sed "s/{{data}}/$RESULT/")
  else
    RESPONSE=$(cat views/find-not-found.jsonr)
  fi

}

