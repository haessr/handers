# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'faker'

puts "Cleaning database..."
# User.destroy_all

puts "Cleaning Messages Table..."
Message.destroy_all

puts "Cleaning Chatrooms Table..."
Chatroom.destroy_all

puts "Cleaning Orders Table..."
Order.destroy_all

puts "Cleaning Products Table..."
Product.destroy_all

puts "Cleaning NGOs Table..."
Npo.destroy_all

puts "Creating NGO"
Npo.create(name: "Greenpeace",url: "www.greenpeace.org", url_photo: "https://storage.googleapis.com/planet4-colombia-stateless/2020/05/65f24819-logogreenpeace_web.jpg", description: "Greenpeace is a non-governmental environmental organization with offices in over 55 countries and an international coordinating body in Amsterdam, the Netherlands. Greenpeace was founded in 1971 by Irving Stowe and Dorothy Stowe, Canadian and US ex-pat environmental activists.")
Npo.create(name: "UNICEF", url: "www.unicef.org", url_photo: "https://www.guiaongs.org/wp-content/uploads/2015/09/unicef_destacada.png", description: "UNICEF, or the United Nations Children's Fund[a] is a United Nations agency responsible for providing humanitarian and developmental aid to children worldwide. U.N. headquarters is based in New York City, it is among the most widespread and recognizable social welfare organizations in the world, with a presence in 192 countries and territories.")
Npo.create(name: "WWF", url: "wwf.panda.org", url_photo: "https://d2ouvy59p0dg6k.cloudfront.net/img/original/wwflogo_apcolor_01_copy.png", description: "The World Wide Fund for Nature (WWF) is an international non-governmental organization founded in 1961 that works in the field of wilderness preservation and the reduction of human impact on the environment. It was formerly named the World Wildlife Fund, which remains its official name in Canada and the United States.")
Npo.create(name: "Save the Children", url_photo: "https://www.mujeresparalasalud.org/nuevoamswp/wp-content/uploads/2013/01/save-the-children.png", url: "www.savethechildren.org", description: "The Save the Children Fund, commonly known as Save the Children was established in the United Kingdom in 1919 to improve the lives of children through better education, health care, and economic opportunities, as well as providing emergency aid in natural disasters, war, and other conflicts. After passing a century, it is now a global movement made up of 29 national member organisations which works in 120 different countries.")
