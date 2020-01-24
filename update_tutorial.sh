
# Replace entire document with  {weight : 590} 
db.unicorns.update({name: 'Roooooodles'} , {weight : 590})

#Returns zero results above command replaces entire document
db.unicorns.find({name: 'Roooooodles'} )


# Updates specifed fields using $set
db.unicorns.update({weight: 590}, {$set: {
name: 'Roooooodles',
dob: new Date(1979, 7, 18, 18, 44),
loves: ['apple'],
gender: 'm',
vampires: 99}})

# increment value
db.unicorns.update({name: 'Pilot'} , {$inc: {vampires: -2} }  )

# Push value to array
db.unicorns.update({name: 'Pilot'} , {$push: {loves: 'sugar'} }  )

# update if not exists
db.foo.update(
   { _id: 1 },
   { $addToSet: { colors: "c" } }
)


# Append list of values into array
db.students.update(
   { name: "joe" },
   { $push: { scores: { $each: [ 90, 92, 85 ] } } }
)

# Updates if min(lowscore, 150)
db.scores.update( { _id: 1 }, { $min: { lowScore: 150 } } )

# price = price*1.25, qty = qty*2
db.products.update(
   { _id: 1 },
   { $mul: { price: NumberDecimal("1.25"), qty: 2 } }
)

# Rename fields
db.students.update( { _id: 1 }, { $rename: { 'nickname': 'alias', 'cell': 'mobile' } } )


# Sort Array after update
db.students.update(
   { _id: 1 },
   {
     $push: {
       quizzes: {
         $each: [ { id: 3, score: 8 }, { id: 4, score: 7 }, { id: 5, score: 6 } ],
         $sort: { score: 1 }
       }
     }
   }
)



# Pull out apples, oranges  from fruits
# ull out carrots from vegetables
db.stores.update(
    { },
    { $pull: { fruits: { $in: [ "apples", "oranges" ] }, vegetables: "carrots" } },
    { multi: true }
)


# pop first element of array
db.students.update( { _id: 1 }, { $pop: { scores: -1 } } )


# pop last element of array
db.students.update( { _id: 1 }, { $pop: { scores: 1 } } )


# Upsert => Insert if not exists else update value
db.hits.update({page: 'unicorns'},
{$inc: {hits: 1}}, {upsert:true});
db.hits.find();

# So far update is on only one document
# To update multiple documents use {multi:true}
db.unicorns.update({},
{$set: {vaccinated: true }},
{multi:true});
db.unicorns.find({vaccinated: true});