require_relative 'task_manager'

manager = TaskManager.new

loop do

  puts "=" * 110

  puts

  puts "===================================="

  puts " TASK MANAGEMENT SYSTEM "
  puts "===================================="
  puts "1. Create Task"
  puts "2. View Tasks"
  puts "3. Create Subtask"
  puts "4. View Subtasks"
  puts "5. Search Task"
  puts "6. Update Task"
  puts "7. Delete Task"
  puts "8. Exit"
  puts "===================================="

  print "Enter Choice: "

  choice = gets.chomp.to_i

  case choice

  when 1
    manager.create_task

  when 2
    manager.view_tasks

  when 3
    manager.create_subtask

  when 4
    manager.view_subtasks

  when 5
    manager.search_task

  when 6
    manager.update_task

  when 7
    manager.delete_task

  when 8
    puts "\nThank You!"
    puts "Program Ended."
    break

  else
    puts "\nInvalid Choice!"
  end

end

