# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

StudyPlan.delete_all
StudyPlanCourse.delete_all
Color.delete_all
User.delete_all

StudyPlan.new.save

Color.create(name: 'rosso', hex: 'F00')
Color.create(name: 'verde', hex: '0C0')
Color.create(name: 'blu', hex: '00F')
Color.create(name: 'verde_acqua', hex: '03f4be')
Color.create(name: 'arancio', hex: 'ff7400')
Color.create(name: 'lilla', hex: '7e79ff')
Color.create(name: 'viola', hex: 'd014f4')
Color.create(name: 'Rosa', hex: 'ff2ce1')

