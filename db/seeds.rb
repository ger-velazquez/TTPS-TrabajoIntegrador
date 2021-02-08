# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new
user.register("TTPSuser@gmail.com", "admin123123", "admin123123")

if user.valid?
    b1 = Book.find_or_create(title: "First Book", user_id: user.id)
    b2 = Book.find_or_create(title: "Second Book", user_id: user.id)
    b3 = Book.find_or_create(title: "Third Book", user_id: user.id)

    n1 = Note.find_or_create(title: "My first Note !", content: "This is an ordinary content", book_id: b1.id)
    n2 = Note.find_or_create(title: "My Second Note !", content: "This is an ordinary content", book_id: b2.id)
    n3 = Note.find_or_create(title: "My Third Note !", content: "This is an ordinary content", book_id: b3.id)