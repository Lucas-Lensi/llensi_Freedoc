# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Patient.destroy_all
Doctor.destroy_all
Appointment.destroy_all
City.destroy_all
Speciality.destroy_all
DocSpecialty.destroy_all

puts "CITY"
100.times do |index|
  City.create(name: Faker::Address.city)
  puts "#{index} villes crées"
end

puts "\n\nSPECIALITY"

100.times do |index|
  Speciality.create(name: Faker::Job.title)
  puts "#{index} spécialitées crées"
end

puts "\n\nDCOTORS & PATIENTS"

100.times do |index|
  Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: City.find(rand(1..100)))
  Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: City.find(rand(1..100)))
  puts "#{index} docteurs et patients crées"
end

puts "\n\nDOC_SPEC"

100.times do |index|
  DocSpecialty.create(doctor: Doctor.find(rand(1..100)), speciality: Speciality.find(rand(1..100)))
  puts "#{index} doc_spec crées"
end

puts "\n\nAPPOINTMENTS"

100.times do |index|
  Appointment.create(doctor: Doctor.find(rand(1..100)), patient: Patient.find(rand(1..100)), date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 7, format: :default), city: City.find(rand(1..100)))
  puts "#{index} rdv crées"
end
