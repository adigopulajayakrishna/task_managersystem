require_relative 'task'
require_relative 'subtask'

class TaskManager

  def initialize
    @tasks = []
    @task_id = 1
    @subtask_id = 1
  end                            

  # -----------------------------
  # Create Task
  # -----------------------------
  def create_task

    puts "\nCreate Task"

    print "Enter Task Name: "
    name = gets.chomp

    print "Enter Description: "
    description = gets.chomp

    print "Enter Due Date (DD-MM-YYYY): "
    due_date = gets.chomp

    print "Enter Category: "
    category = gets.chomp

    print "Enter Priority (H/M/L): "
    priority = gets.chomp.upcase

    task = Task.new(
      @task_id,
      name,
      description,
      due_date,
      category,
      priority
    )

    @tasks << task

    puts "\nTask Created Successfully!"

    @task_id += 1
  end

  # -----------------------------
# View Tasks
# -----------------------------
def view_tasks

  if @tasks.empty?
    puts "\nNo Tasks Available"
    return
  end

  puts "\n================ TASK LIST ================"

  printf("%-5s %-20s %-25s %-15s %-10s %-15s\n",
         "ID",
         "Name",
         "Description",
         "Due Date",
         "Priority",
         "Category")

  puts "-" * 100

  @tasks.each do |task|

    printf("%-5d %-20s %-25s %-15s %-10s %-15s\n",
           task.id,
           task.name,
           task.description,
           task.due_date,
           task.priority,
           task.category)

    if task.subtasks.empty?
      puts "   Subtasks : None"
    else
      puts "   Subtasks:"

      task.subtasks.each do |sub|
        puts "      -> #{sub.id} | #{sub.name} | #{sub.description} | #{sub.due_date} | #{sub.priority}"
      end
    end

    puts "-" * 100
  end

end

  # -----------------------------
  # Create Subtask
  # -----------------------------
  def create_subtask

    if @tasks.empty?
      puts "\nNo Tasks Available"
      return
    end

    print "\nEnter Parent Task ID: "
    parent_id = gets.chomp.to_i

    task = @tasks.find { |t| t.id == parent_id }

    if task.nil?
      puts "Task Not Found!"
      return
    end

    print "Enter Subtask Name: "
    name = gets.chomp

    print "Enter Description: "
    description = gets.chomp

    print "Enter Due Date (DD-MM-YYYY): "
    due_date = gets.chomp

    print "Enter Priority (H/M/L): "
    priority = gets.chomp.upcase

    subtask = SubTask.new(
      @subtask_id,
      name,
      description,
      due_date,
      priority
    )

    task.add_subtask(subtask)

    puts "\nSubtask Added Successfully!"

    @subtask_id += 1
  end

  # -----------------------------
  # View Subtasks
  # -----------------------------
  def view_subtasks

    print "\nEnter Task ID: "
    task_id = gets.chomp.to_i

    task = @tasks.find { |t| t.id == task_id }

    if task.nil?
      puts "Task Not Found!"
      return
    end

    if task.subtasks.empty?
      puts "No Subtasks Available"
      return
    end

    puts "\nSubtasks for Task: #{task.name}"

    printf("%-5s %-20s %-25s %-15s %-10s\n",
           "ID",
           "Name",
           "Description",
           "Due Date",
           "Priority")

    puts "-" * 80

    task.subtasks.each do |sub|

      printf("%-5d %-20s %-25s %-15s %-10s\n",
             sub.id,
             sub.name,
             sub.description,
             sub.due_date,
             sub.priority)
    end
  end

  # -----------------------------
  # Search Task
  # -----------------------------
  def search_task

    print "\nEnter Search Keyword: "
    keyword = gets.chomp.downcase

    results = @tasks.select do |task|

      task.name.downcase.include?(keyword) ||
      task.category.downcase.include?(keyword) ||
      task.priority.downcase.include?(keyword)

    end

    if results.empty?
      puts "\nNo Matching Tasks Found"
      return
    end

    puts "\nMatching Tasks"

    printf("%-5s %-20s %-25s %-15s %-10s %-15s\n",
           "ID",
           "Name",
           "Description",
           "Due Date",
           "Priority",
           "Category")

    puts "-" * 100

    results.each do |task|

      printf("%-5d %-20s %-25s %-15s %-10s %-15s\n",
             task.id,
             task.name,
             task.description,
             task.due_date,
             task.priority,
             task.category)
    end
  end

# -----------------------------
# Update Task
# -----------------------------
def update_task

  print "\nEnter Task ID to Update: "
  task_id = gets.chomp.to_i

  task = @tasks.find { |t| t.id == task_id }

  if task.nil?
    puts "Task Not Found!"
    return
  end

  print "New Name (#{task.name}): "
  name = gets.chomp
  task.name = name unless name.empty?

  print "New Description (#{task.description}): "
  description = gets.chomp
  task.description = description unless description.empty?

  print "New Due Date (#{task.due_date}): "
  due_date = gets.chomp
  task.due_date = due_date unless due_date.empty?

  print "New Category (#{task.category}): "
  category = gets.chomp
  task.category = category unless category.empty?

  print "New Priority (#{task.priority}): "
  priority = gets.chomp.upcase
  task.priority = priority unless priority.empty?

  puts "\nTask Updated Successfully!"
end


# -----------------------------
# Delete Task
# -----------------------------
def delete_task

  print "\nEnter Task ID to Delete: "
  task_id = gets.chomp.to_i

  task = @tasks.find { |t| t.id == task_id }

  if task.nil?
    puts "Task Not Found!"
    return
  end

  @tasks.delete(task)

  puts "\nTask Deleted Successfully!"
end
end