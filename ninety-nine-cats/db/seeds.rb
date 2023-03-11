# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Cat.destroy_all

Cat.create!(birth_date: Date.new(2020,1,1),color: "red",name: "Oliver",sex: "M",description: "The most red cat youve ever seen")
Cat.create!(birth_date: Date.new(2005,7,2),color: "black",name: "Macbeth",sex: "F",description: "An evil bad luck cat")
