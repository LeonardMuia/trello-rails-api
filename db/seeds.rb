# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'rest-client'

# def api_key
#     ENV['API_KEY']
# end

# def token 
#     ENV['TOKEN']
# end

# def idList
#     ENV['ID_LIST']
# end

# def idBoard
#     ENV['ID_BOARD']
# end

# def get_lists
    
#     lists = RestClient.get("https://api.trello.com/1/boards/#{idBoard}/lists?key=#{api_key}&token=#{token}")

#     lists_array = JSON.parse(lists)

#     lists_array.each do |s|
#         List.create(name: s["name"])
#     end
# end

# get_lists()
