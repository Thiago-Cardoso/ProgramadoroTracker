# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cadastrando user...."
User.create(name: 'teste', email: 'teste@gmail.com', password: '123456', password_confirmation: '123456')

puts "Cadastrando configuration...."
ConfigurationTask.create(user_id: 1, duration: 5, duration_break: 2, duration_break_long: 2, long_pause_delay: 2, have_song: 0, template: 1)
ConfigurationTask.create(user_id: 1, duration: 6, duration_break: 3, duration_break_long: 4, long_pause_delay: 1, have_song: 0, template: 1)
ConfigurationTask.create(user_id: 1, duration: 3, duration_break: 2, duration_break_long: 3, long_pause_delay: 3, have_song: 0, template: 1)
ConfigurationTask.create(user_id: 1, duration: 2, duration_break: 1, duration_break_long: 2, long_pause_delay: 2, have_song: 0, template: 1)

puts "Cadastrando categoria...."
Category.create(user_id: 1,description: "category 1")
Category.create(user_id: 1,description: "category 2")
Category.create(user_id: 1,description: "category 3")

puts "Cadastrando task...."
Task.create(user_id: 1, category_id: 1, description: "task 1", date_end: Time.now, is_current: 1, status: 0)
Task.create(user_id: 1, category_id: 2, description: "task 2", date_end: Time.now, is_current: 0, status: 0)
Task.create(user_id: 1, category_id: 3, description: "task 3", date_end: Time.now, is_current: 0, status: 1)
Task.create(user_id: 1, category_id: 4, description: "task 4", date_end: Time.now, is_current: 0, status: 1)
