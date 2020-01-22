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
