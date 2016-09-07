class AddSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.column :name, :string
      t.column :number, :integer
      t.column :lesson_id, :integer

      t.timestamps
    end
  end
end
