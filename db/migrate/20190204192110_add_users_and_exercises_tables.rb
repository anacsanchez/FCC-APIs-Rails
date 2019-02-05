class AddUsersAndExercisesTables < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.timestamps
    end

    create_table :exercises do |t|
      t.belongs_to :user, index: true
      t.date :date
      t.text :description
      t.integer :duration
    end
  end
end
