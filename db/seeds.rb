# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

collections = Collection.create([{ title: 'The Human Body', author: 'Isaac Asimov', category: :books }, { title: 'The Gods Themselves', author: 'Isaac Asimov', category: :books }])