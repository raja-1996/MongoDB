
# Insert Document into collection
db.unicorns.insert({name: 'Dunx',
                    dob: new Date(1976, 6, 18, 18, 18),
                    loves: ['grape', 'watermelon'],
                    weight: 704,
                    gender: 'm',
                    vampires: 165});

# The special $lt, $lte, $gt, $gte and $ne are used for less than, less than or equal, greater than, 
# greater than or equal and not equal operations

# where gender == f
db.unicorns.find({gender:'f'})

# where gender == f and name == Solnara
db.unicorns.find({gender:'f', name: 'Solnara'})

db.unicorns.find({gender:'f', weight : {$gt : 500}} )

db.unicorns.find({gender:'f', weight : {$gte : 500}} )

db.unicorns.find({gender:'f', weight : {$lte : 500}} )

db.unicorns.find({gender:'f', weight : {$lt : 500}} )

db.unicorns.find({gender: {$ne : 'f'} , weight : {$gt : 500}} )

# get all documents where vampires field is not present
db.unicorns.find({vampires : {$exists : false} } )

# where loves in ['apple', 'carrot']
db.unicorns.find({loves : {$in : ['apple', 'carrot'] } } )

# where loves not in ['apple', 'carrot']
db.unicorns.find({loves : {$nin : ['apple', 'carrot'] } } )

# where gender == m and  ( loves == carrot or weight > 500 )
db.unicorns.find({  gender: 'm', $or : [ { loves : 'carrot' } , { weight : {$gt : 500} } ]   })

db.unicorns.remove({})









