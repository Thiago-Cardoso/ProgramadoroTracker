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
ConfigurationTask.create(user_id: 1, duration: 25, duration_break: 2, duration_break_long: 12, long_pause_delay: 4, have_song: 0, template: 1)
ConfigurationTask.create(user_id: 1, duration: 50, duration_break: 10, duration_break_long: 20, long_pause_delay: 2, have_song: 0, template: 2)
ConfigurationTask.create(user_id: 1, duration: 30, duration_break: 2, duration_break_long: 25, long_pause_delay: 4, have_song: 0, template: 3)

puts "Cadastrando categoria...."
Category.create(user_id: 1,description: "category 1")
Category.create(user_id: 1,description: "category 2")
Category.create(user_id: 1,description: "category 3")

puts "Cadastrando task...."

Task.create(user_id: 1, category_id: 1, description: "task 1", end_date: Time.now, is_current: 1, status: 0, pomodoro_count: 2, work_time:Time.now, pause_time:Time.now)
Task.create(user_id: 1, category_id: 2, description: "task 2", end_date: Time.now, is_current: 0, status: 0, pomodoro_count: 3, work_time:Time.now, pause_time:Time.now)
Task.create(user_id: 1, category_id: 3, description: "task 3", end_date: Time.now, is_current: 0, status: 1, pomodoro_count: 4, work_time:Time.now, pause_time:Time.now)
Task.create(user_id: 1, category_id: 4, description: "task 4", end_date: Time.now, is_current: 0, status: 1, pomodoro_count: 5, work_time:Time.now, pause_time:Time.now)
