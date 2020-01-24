
# Get only name field
db.unicorns.find({}, {name : 1} )

# Sort descending
db.unicorns.find().sort({weight: -1})

# Show only  5 documents  
db.unicorns.find().sort({weight: -1}).limit(5)

# Skip first 2 documents
db.unicorns.find().sort({weight: -1}).limit(5).skip(2)

# count
db.unicorns.count({vampires : {$gt : 50}})
OR
db.unicorns.find({vampires : {$gt : 50}}).count()

