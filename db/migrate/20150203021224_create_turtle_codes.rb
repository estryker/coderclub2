class CreateTurtleCodes < ActiveRecord::Migration
  def change
    create_table :turtle_codes do |t|
      t.string :url_id
      t.text :code
      t.string :code_hash

      t.timestamps
    end
  end
end
