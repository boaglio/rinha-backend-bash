 function handle_POST_create() {
 
  INSERT_RESULT=$(mongosh db-mongodb:27017/rinhadb --quiet --eval 'const result = db.people.insertOne('"$BODY"'); print(result.insertedId);')
 
  if [ -n "$INSERT_RESULT" ]; then
    UUID="$INSERT_RESULT"
    RESPONSE=$(cat views/201.http | sed "s/{{uuid}}/$UUID/")
  else
    RESPONSE=$(cat views/422.http)
  fi

}