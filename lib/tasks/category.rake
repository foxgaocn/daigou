task :create_category => :environment do
  Category.destroy_all
  c1 = Category.create(name: "保健品")
  c2 = Category.create(name: "奶粉")
  c3 = Category.create(name: "美容/化妆")
  c4 = Category.create(name: "绿色食品")
  c1.sub_categories.create(name: "儿童保健品")
  c1.sub_categories.create(name: "成人保健品")
  c2.sub_categories.create(name: "婴幼儿奶粉")
  c2.sub_categories.create(name: "成人奶粉")
  c4.sub_categories.create(name: "婴幼儿食品")
  c4.sub_categories.create(name: "成人食品")
end