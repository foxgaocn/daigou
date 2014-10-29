# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if(Category.count == 0) 
  Category.create(name: "婴幼儿用品")
  Category.create(name: "保健品")
  Category.create(name: "葡萄酒")
  Category.create(name: "UGG")
  Category.create(name: "日用品")
  Category.create(name: "其他")
end
