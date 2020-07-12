class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :content
      t.datetime :start_at
      t.datetime :end_at
      t.string :priority
      t.string :status
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
