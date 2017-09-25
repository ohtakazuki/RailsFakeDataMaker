class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string  :name
      t.integer :format, default: 0, null: false, limit: 1
      t.integer :char_code, default: 0, null: false, limit: 1

      t.timestamps
    end
  end
end

