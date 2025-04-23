test> use retailDB
switched to db retailDB
retailDB> db.Products.insertMany([
 {
 name: "Laptop",
 brand: "BrandA",
 features: [
 { name: "Processor", value: "Intel i7" },
 { name: "RAM", value: "16GB" },
 { name: "Storage", value: "512GB SSD" }
 ],
 reviews: [
 { user: "Alice", rating: 5, comment: "Excellent!" },
 { user: "Bob", rating: 4, comment: "Very good" },
 { user: "Charlie", rating: 3, comment: "Average" }
 ]
 },
 {
 name: "Smartphone",
 brand: "BrandB",
 features: [
 { name: "Processor", value: "Snapdragon 888" },
 { name: "RAM", value: "8GB" },
 { name: "Storage", value: "256GB" }
 ],
 reviews: [
 { user: "Dave", rating: 4, comment: "Good phone" },
 { user: "Eve", rating: 2, comment: "Not satisfied" }
 ]
 }
])
1. The $ Projection Operator
Example: Find the product named “Laptop” and project the review from the user “Alice”.
retailDB> db.Products.find(
 { name: "Laptop", "reviews.user": "Alice" },
 { "reviews.$": 1 }
).pretty()
2. The $elemMatch Projection Operator
Example: Find the product named “Laptop” and project the review where the rating is
greater than 4.
retailDB> db.Products.find(
 { name: "Laptop" },
 { reviews: { $elemMatch: { rating: { $gt: 4 } } } }
).pretty()
3. The $slice Projection Operator
Example: Find the product named “Smartphone” and project the first review.
retailDB> db.Products.find(
 { name: "Smartphone" },
 { reviews: { $slice: 1 } }
).pretty()
