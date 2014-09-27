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

StudyPlan.new.save

Color.create(name: 'rosso', hex: 'F00')
Color.create(name: 'verde', hex: '0D0')
Color.create(name: 'blu', hex: '00F')
Color.create(name: '???', hex: 'AA0')
Color.create(name: '???', hex: '0AA')
Color.create(name: '???', hex: 'E0A')
Color.create(name: 'nero', hex: '000')

