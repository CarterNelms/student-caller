class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.timestamp :called_at, :default => Time.new(0)

      t.timestamps
    end
  end
end
