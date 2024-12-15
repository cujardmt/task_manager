# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Clear existing data
puts "Clearing data..."
Subtask.delete_all
Task.delete_all
Category.delete_all
User.delete_all
puts "Table data cleared!"


puts "Inserting Users."
# Create Users
users = User.create([
  { name: 'John Doe', username: 'johnDoe',  email: 'john@example.com', password: 'password123' },
  { name: 'Jane Smith', username: 'janeSmith', email: 'jane@example.com', password: 'password123' }
])



puts "Inserting Categories."
# Create Categories for each user
categories = Category.create([
  { name: 'Work' },
  { name: 'Personal' },
  { name: 'Fitness' },
  { name: 'Health' }
])

priorities = Priority.create([
  { name: 'Highest' },
  { name: 'High' },
  { name: 'Medium' },
  { name: 'Low' },
  { name: 'Lowest' }
])

# Seed Statuses
statuses = Status.create([
  { name: 'New' },
  { name: 'In Progress' },
  { name: 'Done' }
])

# Create Tasks for each user
# puts "Inserting Tasks for each Users."
# tasks = Task.create([
#   { user_id: users[0].id, name: 'Finish project plan', description: 'Complete the document', category_id: categories[0].id, priority: 'High', status: 'In Progress', due_date: '2024-12-10' },
#   { user_id: users[0].id, name: 'Buy groceries', description: 'Buy items for the week', category_id: categories[1].id, priority: 'Medium', status: 'Pending', due_date: '2024-12-06' },
#   { user_id: users[0].id, name: 'Plan weekend trip', description: 'Research destinations and costs', category_id: categories[1].id, priority: 'Low', status: 'Pending', due_date: '2024-12-15' },
#   { user_id: users[1].id, name: 'Morning run', description: 'Run 5 km in the park', category_id: categories[2].id, priority: 'Low', status: 'Completed', due_date: '2024-12-02' },
#   { user_id: users[1].id, name: 'Schedule doctor appointment', description: 'Call the clinic to schedule', category_id: categories[3].id, priority: 'High', status: 'Pending', due_date: '2024-12-07' },
#   { user_id: users[1].id, name: 'Meditation practice', description: 'Do a 15-minute session', category_id: categories[2].id, priority: 'Medium', status: 'In Progress', due_date: '2024-12-06' },
#   { user_id: users[0].id, name: 'Review team report', description: 'Provide feedback on draft', category_id: categories[0].id, priority: 'High', status: 'Pending', due_date: '2024-12-09' },
#   { user_id: users[0].id, name: 'Organize files', description: 'Sort documents into folders', category_id: categories[0].id, priority: 'Low', status: 'In Progress', due_date: '2024-12-11' },
#   { user_id: users[1].id, name: 'Yoga session', description: 'Follow a 30-minute video', category_id: categories[3].id, priority: 'Medium', status: 'Pending', due_date: '2024-12-08' },
#   { user_id: users[1].id, name: 'Grocery shopping', description: 'Buy fresh fruits and vegetables', category_id: categories[3].id, priority: 'Medium', status: 'Pending', due_date: '2024-12-06' }
# ])

# # Create Subtasks for some tasks
# puts "Inserting Subtasks for each Task."
# subtasks = Subtask.create([
#   { task_id: tasks[0].id, name: 'Research templates', status: 'Completed' },
#   { task_id: tasks[0].id, name: 'Draft initial plan', status: 'In Progress' },
#   { task_id: tasks[1].id, name: 'List needed items', status: 'Completed' },
#   { task_id: tasks[4].id, name: 'Find clinic phone number', status: 'Completed' },
#   { task_id: tasks[4].id, name: 'Set up time slot', status: 'Pending' },
#   { task_id: tasks[9].id, name: 'Check fridge for missing items', status: 'Completed' },
#   { task_id: tasks[9].id, name: 'Write shopping list', status: 'Pending' }
# ])

puts "Seed data created successfully!"
puts "Users:"
users.each do |user|
    puts "#{user.id} : #{user.name} : #{user.email}"
    puts "Tasks"
    user.tasks.each do |task|
        puts "#{task.category.name} - #{task.name}"
    end
end