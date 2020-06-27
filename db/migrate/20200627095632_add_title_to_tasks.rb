class AddTitleToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column  :tasks, :title, :string 
    add_column  :tasks, :start_at, :time 
    add_column  :tasks, :end_at, :time 
    add_column  :tasks, :priority, :string 
    add_column  :tasks, :status, :string 
  end
end
