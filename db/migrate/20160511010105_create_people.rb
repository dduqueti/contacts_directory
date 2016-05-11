class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, limit: 254
      t.string :job
      t.text :bio
      t.string :gender, limit: 1
      t.date :birthdate
      t.string :picture

      t.timestamps null: false
    end
  end
end
