class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.column :name, :string
      t.column :content, :text
      t.column :course_id, :integer

      t.timestamps
    end
  end
end
