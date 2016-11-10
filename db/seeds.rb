# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# This is default user
Organization.create(owner_id: 1, name: 'First Organization', domain: 'first', subdomain: 'test')
User.create(email: 'example@gmail.com', password: 'changeme', system_admin: true, confirmed_at: Time.now)
Page.create(url: 'home', position: 1, visible: true, title: 'first test page', body: 'test body')
