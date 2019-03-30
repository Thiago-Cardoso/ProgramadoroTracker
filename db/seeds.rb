# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cadastrando user...."
User.create(name: 'teste', email: 'teste@gmail.com', password: '123456', password_confirmation: '123456')
User.create(name: 'huguinho', email: 'huguinho@gmail.com', password: '123456', password_confirmation: '123456')
User.create(name: 'zezinho', email: 'zezinho@gmail.com', password: '123456', password_confirmation: '123456')
User.create(name: 'pedrinho', email: 'pedrinho@gmail.com', password: '123456', password_confirmation: '123456')

puts "Cadastrando configuration...."
ConfigurationTask.create(user_id: 1, duration: 25, duration_break: 2, duration_break_long: 12, long_pause_delay: 4, have_song: 0, template: 1)
ConfigurationTask.create(user_id: 2, duration: 5, duration_break: 2, duration_break_long: 2, long_pause_delay: 2, have_song: 0, template: 1)
ConfigurationTask.create(user_id: 3, duration: 5, duration_break: 2, duration_break_long: 2, long_pause_delay: 2, have_song: 0, template: 1)
ConfigurationTask.create(user_id: 4, duration: 6, duration_break: 3, duration_break_long: 4, long_pause_delay: 1, have_song: 0, template: 1)


puts "Cadastrando categoria...."
Category.create(user_id: 1,description: "category 1")
Category.create(user_id: 1,description: "category 2")
Category.create(user_id: 1,description: "category 3")

Category.create(user_id: 2,description: "category 1")
Category.create(user_id: 2,description: "category 2")
Category.create(user_id: 2,description: "category 3")

Category.create(user_id: 3,description: "category 1")
Category.create(user_id: 3,description: "category 2")
Category.create(user_id: 3,description: "category 3")

Category.create(user_id: 4,description: "category 1")
Category.create(user_id: 4,description: "category 2")
Category.create(user_id: 4,description: "category 3")

puts "Cadastrando task...."

Task.create(user_id: 1, category_id: 1, description: "task 1", end_date: Time.now, is_current: 1, status: 0, pomodoro_count: 2, work_time:Time.now, pause_time:Time.now)
Task.create(user_id: 1, category_id: 2, description: "task 2", end_date: Time.now, is_current: 0, status: 0, pomodoro_count: 3, work_time:Time.now, pause_time:Time.now)
Task.create(user_id: 1, category_id: 3, description: "task 3", end_date: Time.now, is_current: 0, status: 1, pomodoro_count: 4, work_time:Time.now, pause_time:Time.now)
Task.create(user_id: 1, category_id: 4, description: "task 4", end_date: Time.now, is_current: 0, status: 1, pomodoro_count: 5, work_time:Time.now, pause_time:Time.now)
Task.create(user_id: 1, category_id: 1, description: "task 1", end_date: Time.now, is_current: 1, status: 0, pomodoro_count: 2, work_time:Time.now, pause_time:Time.now, created_at: "2019-03-01 14:55:47")
Task.create(user_id: 1, category_id: 2, description: "task 2", end_date: Time.now, is_current: 0, status: 1, pomodoro_count: 3, work_time:Time.now, pause_time:Time.now, created_at: "2019-03-02 14:55:47")
Task.create(user_id: 1, category_id: 3, description: "task 3", end_date: Time.now, is_current: 0, status: 1, pomodoro_count: 4, work_time:Time.now, pause_time:Time.now, created_at: "2019-03-03 14:55:47")
Task.create(user_id: 1, category_id: 2, description: "task 3", end_date: Time.now, is_current: 0, status: 1, pomodoro_count: 5, work_time:Time.now, pause_time:Time.now, created_at: "2019-03-04 14:55:47")
Task.create(user_id: 1, category_id: 1, description: "task 1", end_date: Time.now, is_current: 1, status: 0, pomodoro_count: 2, work_time:Time.now, pause_time:Time.now, created_at: "2019-03-09 14:55:47")
Task.create(user_id: 1, category_id: 2, description: "task 2", end_date: Time.now, is_current: 0, status: 0, pomodoro_count: 3, work_time:Time.now, pause_time:Time.now, created_at: "2019-03-10 14:55:47")
Task.create(user_id: 1, category_id: 3, description: "task 3", end_date: Time.now, is_current: 0, status: 1, pomodoro_count: 4, work_time:Time.now, pause_time:Time.now, created_at: "2019-03-15 14:55:47")
Task.create(user_id: 1, category_id: 2, description: "task 3", end_date: Time.now, is_current: 0, status: 1, pomodoro_count: 5, work_time:Time.now, pause_time:Time.now, created_at: "2019-03-18 14:55:47")
Task.create(user_id: 1, category_id: 1, description: "task 1", end_date: Time.now, is_current: 1, status: 0, pomodoro_count: 2, work_time:Time.now, pause_time:Time.now, created_at: "2019-03-21 14:55:47")
Task.create(user_id: 1, category_id: 2, description: "task 2", end_date: Time.now, is_current: 0, status: 1, pomodoro_count: 3, work_time:Time.now, pause_time:Time.now, created_at: "2019-03-22 14:55:47")
Task.create(user_id: 1, category_id: 3, description: "task 3", end_date: Time.now, is_current: 0, status: 1, pomodoro_count: 4, work_time:Time.now, pause_time:Time.now, created_at: "2019-03-27 14:55:47")
Task.create(user_id: 1, category_id: 2, description: "task 3", end_date: Time.now, is_current: 0, status: 1, pomodoro_count: 5, work_time:Time.now, pause_time:Time.now, created_at: "2019-03-28 14:55:47")

Task.create(user_id: 2, category_id: 5, description: "task 5", end_date: Time.now, is_current: 1, status: 0, pomodoro_count: 2, work_time:Time.now, pause_time:Time.now, created_at: "2019-03-01 14:55:47")
Task.create(user_id: 2, category_id: 6, description: "task 6", end_date: Time.now, is_current: 0, status: 0, pomodoro_count: 3, work_time:Time.now, pause_time:Time.now, created_at: "2019-03-02 14:55:47")
Task.create(user_id: 2, category_id: 7, description: "task 7", end_date: Time.now, is_current: 0, status: 1, pomodoro_count: 4, work_time:Time.now, pause_time:Time.now, created_at: "2019-03-05 14:55:47")
Task.create(user_id: 2, category_id: 8, description: "task 8", end_date: Time.now, is_current: 0, status: 1, pomodoro_count: 5, work_time:Time.now, pause_time:Time.now, created_at: "2019-03-04 14:55:47")

Task.create(user_id: 3, category_id: 9, description: "task 5", end_date: Time.now, is_current: 1, status: 0, pomodoro_count: 2, work_time:Time.now, pause_time:Time.now, created_at: "2019-03-06 14:55:47")
Task.create(user_id: 3, category_id: 10, description: "task 6", end_date: Time.now, is_current: 0, status: 0, pomodoro_count: 3, work_time:Time.now, pause_time:Time.now, created_at: "2019-03-09 14:55:47")
Task.create(user_id: 3, category_id: 11, description: "task 7", end_date: Time.now, is_current: 0, status: 1, pomodoro_count: 4, work_time:Time.now, pause_time:Time.now, created_at: "2019-03-15 14:55:47")
Task.create(user_id: 3, category_id: 12, description: "task 8", end_date: Time.now, is_current: 0, status: 1, pomodoro_count: 5, work_time:Time.now, pause_time:Time.now, created_at: "2019-03-24 14:55:47")


Task.create(user_id: 4, category_id: 13, description: "task 5", end_date: Time.now, is_current: 1, status: 0, pomodoro_count: 2, work_time:Time.now, pause_time:Time.now, created_at: "2019-03-06 14:55:47")
Task.create(user_id: 4, category_id: 14, description: "task 6", end_date: Time.now, is_current: 0, status: 0, pomodoro_count: 3, work_time:Time.now, pause_time:Time.now, created_at: "2019-03-09 14:55:47")
Task.create(user_id: 4, category_id: 15, description: "task 7", end_date: Time.now, is_current: 0, status: 1, pomodoro_count: 4, work_time:Time.now, pause_time:Time.now, created_at: "2019-03-15 14:55:47")
Task.create(user_id: 4, category_id: 16, description: "task 8", end_date: Time.now, is_current: 0, status: 1, pomodoro_count: 5, work_time:Time.now, pause_time:Time.now, created_at: "2019-03-24 14:55:47")
