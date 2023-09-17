function handle_GET_count() {
  RESULT=$(mongosh db-mongodb:27017/rinhadb --quiet  --eval 'db.people.countDocuments()')
  RESPONSE=$(cat views/count.textr | sed "s/{{count}}/$RESULT/")
}
