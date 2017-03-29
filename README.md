## Book Library

Building a library of our favorite books.

We need Genres, Books, and Authors.

1. What is this domain model? How are these classes related?
2. Create the migrations needed to create the schema

SELECT * FROM genres
JOIN book_genres
ON book_genres.genres_id = genres.id
JOIN books
ON book_genres.book_id = books.id
JOIN authors
ON authors.id = books.author_id
WHERE authors.name = 'Ted Turner'
authors

id | name
1    "Ted Turner"
2    "Tana French"

books

id | title  | author_id
1    "A River Runs Through It" | 1
2     "Into the Woods"         | 2

genres
id | name
1    "Horror"
2    "Comedy"

book_genres
id | book_id | genre_id
1      1          1
2      1          2
3      2          1   
