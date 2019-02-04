class CreateShorturlsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :shorturls do |t|
      t.string 'original_url'
    end
  end
end
