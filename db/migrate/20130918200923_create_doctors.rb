class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.belongs_to :specialty

      t.timestamps
    end
    add_index :doctors, :specialty_id
  end
end
