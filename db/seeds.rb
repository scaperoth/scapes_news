# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'
include NewsItemsHelper

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

NewsSource.create!(name: 'WIRED', url: 'https://www.wired.com/feed')  
NewsSource.create!(name: 'TechCrunch', url: 'http://feeds.feedburner.com/TechCrunch') 
NewsSource.create!(name: 'CNET', url: 'https://www.cnet.com/rss/all/')   
NewsSource.create!(name: 'TechRadar', url: 'http://www.techradar.com/rss')   

populate_feed