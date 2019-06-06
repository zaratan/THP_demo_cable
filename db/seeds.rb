# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

user1 = User.create(email: "user1@lol.com", password: "pommes")
user2 = User.create(email: "user2@lol.com", password: "pommes")
user3 = User.create(email: "user3@lol.com", password: "pommes")

classroom1 = Classroom.create(title: "First classroom", description: "DESC 1")
classroom2 = Classroom.create(title: "Second classroom", description: "DESC 2")

classroom1.users << user1
classroom1.users << user2
classroom1.users << user3

classroom2.users << user1
classroom2.users << user2
