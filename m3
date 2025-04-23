db.Employees.insertMany([
 { name: "Alice", age: 30, department: "HR", salary: 50000, joinDate: new Date("2015-01-15") },
 { name: "Bob", age: 24, department: "Engineering", salary: 70000, joinDate: new Date("2019-
03-10") },
 { name: "Charlie", age: 29, department: "Engineering", salary: 75000, joinDate: new
Date("2017-06-23") },
 { name: "David", age: 35, department: "Marketing", salary: 60000, joinDate: new Date("2014-
11-01") },
 { name: "Eve", age: 28, department: "Finance", salary: 80000, joinDate: new Date("2018-08-
19") }
])
1. $eq (Equal)
companyDB> db.Employees.find({ department: { $eq: "Engineering" } }).pretty()
2. $ne (Not Equal)
companyDB> db.Employees.find({ department: { $ne: "HR" } }).pretty()
3. $gt (Greater Than)
companyDB> db.Employees.find({ age: { $gt: 30 } }).pretty()
4. $lt (Less Than)
companyDB> db.Employees.find({ salary: { $lt: 70000 } }).pretty()
5. $gte (Greater Than or Equal)
companyDB> db.Employees.find({ joinDate: { $gte: new Date("2018-01-01") } }).pretty()
6. $lte (Less Than or Equal)
companyDB> db.Employees.find({ age: { $lte: 28 } }).pretty()
Queries Using Logical Selectors:
1. $and (Logical AND)
companyDB> db.Employees.find({ $and: [{ department: "Engineering" }, { salary: { $gt: 70000 } } ]
}).pretty()
2. $or (Logical OR)
companyDB> db.Employees.find({ $or: [ { department: "HR" }, { salary: { $lt: 60000 } } ] }).pretty()
3. $not (Logical NOT)
companyDB> db.Employees.find({ department: { $not: { $eq: "Engineering" } } }).pretty()
4. $nor (Logical NOR)
companyDB> db.Employees.find({ $nor: [ { department: "HR" }, { salary: { $gt: 75000 } } ]
).pretty()
b. Query selectors (Geospatial selectors, Bitwise selectors)
Geospatial Selectors:
test> use geoDatabase
switched to db geoDatabase
geoDatabase> db.Places.insertMany([
 { name: "Central Park", location: { type: "Point", coordinates: [-73.9654, 40.7829] } },
 { name: "Times Square", location: { type: "Point", coordinates: [-73.9851, 40.7580] } },
 { name: "Brooklyn Bridge", location: { type: "Point", coordinates: [-73.9969, 40.7061] } },
 { name: "Empire State Building", location: { type: "Point", coordinates: [-73.9857, 40.7488]
} },
 { name: "Statue of Liberty", location: { type: "Point", coordinates: [-74.0445, 40.6892] } }
])
// Create a geospatial index
geoDatabase> db.Places.createIndex({ location: "2dsphere" })
Geospatial Queries:
1. $near (Find places near a certain point)
geoDatabase> db.Places.find({ location: { $near: { $geometry: { type: "Point",
coordinates: [-73.9851, 40.7580] }, $maxDistance: 5000 // distance in meters } }}).pretty()
2. $geoWithin (Find places within a specific area)
geoDatabase> db.Places.find({ location: { $geoWithin: { $geometry: { type: "Polygon",
coordinates: [ [ [-70.016, 35.715],
 [-74.014, 40.717],
 [-73.990, 40.730],
 [-73.990, 40.715],
 [-70.016, 35.715] ] ] } }}).pretty()
Bitwise Selectors:
test> use techDB
techDB> db.Devices.insertMany([
 { name: "Device A", status: 5 }, // Binary: 0101
 { name: "Device B", status: 3 }, // Binary: 0011
 { name: "Device C", status: 12 }, // Binary: 1100
 { name: "Device D", status: 10 }, // Binary: 1010
 { name: "Device E", status: 7 } // Binary: 0111
])
Bitwise Queries:
1. $bitsAllSet (Find documents where all bits are set)
 techDB> db.Devices.find({ status: { $bitsAllSet: [0, 2] }}).pretty()
2. $bitsAnySet (Find documents where any of the bits are set)
techDB> db.Devices.find({ status: { $bitsAnySet: [1] }}).pretty()
3. $bitsAllClear (Find documents where all bits are clear)
techDB> db.Devices.find({ status: { $bitsAllClear: [1, 3] }}).pretty()
4. $bitsAnyClear (Find documents where any of the bits are clear)
techDB> db.Devices.find({ status: { $bitsAnyClear: [0] }}).pretty()
