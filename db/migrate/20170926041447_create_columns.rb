class CreateColumns < ActiveRecord::Migration[5.0]
  def change
    create_table :columns do |t|
      # t.references :job, foreign_key: true
      t.integer :job_id
      t.string :name
      t.integer :data_type, default: 0, null: false, limit: 1
      t.string :data_key

      t.timestamps
    end
  end
end
