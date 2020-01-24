# Aggregations

# groupby type_of_food and count number of results
db.getCollection('restaurants').aggregate([ { $group : { _id : "$type_of_food", num_posts : {$sum : 1} } }])

# groupby type_of_food and sum ratings
db.getCollection('restaurants').aggregate( [  {$group : { _id : "$type_of_food", sum_ratings: { $sum: "$rating" } } }  ] )


# groupby type_of_food and minimum of ratings
db.getCollection('restaurants').aggregate( [  {  $group : {  _id : "$type_of_food", min_rating : {  $min : "$rating" }  } } ] )

# groupby type_of_food and maximum of ratings
db.getCollection('restaurants').aggregate( [  {  $group : {  _id : "$type_of_food", min_rating : {  $max : "$rating" }  } } ] )

# groupby type_of_food and average of ratings
db.getCollection('restaurants').aggregate( [  {  $group : {  _id : "$type_of_food", min_rating : {  $avg : "$rating" }  } } ] )

# groupby type_of_food and make list of ratings
db.getCollection('restaurants').aggregate( [   {$group : { _id: "$type_of_food", ratings: { $push : "$rating" }  } }  ] )

# groupby type_of_food and make unique list(set) of ratings
db.getCollection('restaurants').aggregate( [   {$group : { _id: "$type_of_food", ratings: { $addToSet : "$rating" }  } }  ] )

# groupby type_of_food and get first rating
db.getCollection('restaurants').aggregate( [   {$group : { _id: "$type_of_food", first_rating: { $first : "$rating" }  } }  ] )

# groupby type_of_food and get last rating
db.getCollection('restaurants').aggregate( [   {$group : { _id: "$type_of_food", first_rating: { $last : "$rating" }  } }  ] )


# 1. filter by weight < 600
# 2. group by gender and caluclate count of docuemnts and avg of vampires
# 3. sort resulting output docs by avgvamp
db.unicorns.aggregate([
{ $match : { weight : { $lt: 600} } }, 
{ $group : { _id: '$gender', total: {$sum:1}, avgVamp: {$avg: '$vampires'} } },
{ $sort : {avgVamp : -1} }
])


# $unwind
db.inventory.insertOne({ "_id" : 1, "item" : "ABC1", sizes: [ "S", "M", "L"] })
db.inventory.aggregate( [ { $unwind : "$sizes" } ] )
{ "_id" : 1, "item" : "ABC1", "sizes" : "S" }
{ "_id" : 1, "item" : "ABC1", "sizes" : "M" }
{ "_id" : 1, "item" : "ABC1", "sizes" : "L" }


# Return Largest and Smallest Cities by State
document = {
                "_id": "10280",
                "city": "NEW YORK",
                "state": "NY",
                "pop": 5574,
                "loc": [
                    -74.016323,
                    40.710537
                ]
            }

db.zipcodes.aggregate( [
   { $group:
      {
        _id: { state: "$state", city: "$city" },
        pop: { $sum: "$pop" }
      }
   },

   { $sort: { pop: 1 } },

   { $group:
      {
        _id : "$_id.state",
        biggestCity:  { $last: "$_id.city" },
        biggestPop:   { $last: "$pop" },
        smallestCity: { $first: "$_id.city" },
        smallestPop:  { $first: "$pop" }
      }
   },

  { $project:
    { _id: 0,
      state: "$_id",
      biggestCity:  { name: "$biggestCity",  pop: "$biggestPop" },
      smallestCity: { name: "$smallestCity", pop: "$smallestPop" }
    }
  }
] )

# The following operation returns user names in upper case and in alphabetical order. 
# The aggregation includes user names for all documents in the users collection. 
# You might do this to normalize user names for processing.
db.users.aggregate(
  [
    { $project : { name:{$toUpper:"$_id"} , _id:0 } },
    { $sort : { name : 1 } }
  ]
)

# https://docs.mongodb.com/manual/tutorial/aggregation-with-user-preference-data/


