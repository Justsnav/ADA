> db.createCollection("Movies")
{ ok: 1 }
MoviesDB> db.Movies.insertMany([
 { title: "Inception", director: "Christopher Nolan", genre: "Science Fiction", year: 2010,
ratings: { imdb: 8.8, rottenTomatoes: 87 } },
 { title: "The Matrix", director: "Wachowskis", genre: "Science Fiction", year: 1999, ratings: {
imdb: 8.7, rottenTomatoes: 87 } },
 { title: "The Godfather", director: "Francis Ford Coppola", genre: "Crime", year: 1972,
ratings: { imdb: 9.2, rottenTomatoes: 97 } },
 { title: "Pulp Fiction", director: "Quentin Tarantino", genre: "Crime", year: 1994, ratings: {
imdb: 8.9, rottenTomatoes: 92 } },
 { title: "The Shawshank Redemption", director: "Frank Darabont", genre: "Drama", year:
1994, ratings: { imdb: 9.3, rottenTomatoes: 91 } },
 { title: "The Dark Knight", director: "Christopher Nolan", genre: "Action", year: 2008,
ratings: { imdb: 9.0, rottenTomatoes: 94 } },
 { title: "Fight Club", director: "David Fincher", genre: "Drama", year: 1999, ratings: { imdb:
8.8, rottenTomatoes: 79 } }
])



> db.Movies.find({}, { title: 1, director: 1 })
db.Movies.find({}, { title: 1, director: 1, _id: 0 })


Excluding Specific Field:
MoviesDB> db.Movies.find({}, { ratings: 0 })


Combining Filter & Projection:
MoviesDB> db.Movies.find({ director: "Christopher Nolan" }, { title: 1, year: 1, _id: 0 })


b. Use of Limit and find in MongoDB query
MoviesDB> db.Movies.find({}, { title: 1, director: 1, year: 1, _id: 0 }).limit(5)
