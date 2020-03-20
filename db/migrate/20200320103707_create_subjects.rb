class CreateSubjects < ActiveRecord::Migration[6.0]

  def up
    create_table :subjects do |t|
      t.sring "name"
      t.integer "position"
      t.bolean "visible", :default => false
      t.timestamps
    end
  end

  def down
    drop table :subject
  end
end
