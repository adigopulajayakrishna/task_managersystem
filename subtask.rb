class SubTask
  attr_accessor :id,
                :name,
                :description,
                :due_date,
                :priority

  def initialize(id, name, description, due_date, priority)
    @id = id
    @name = name
    @description = description
    @due_date = due_date
    @priority = priority
  end
end
