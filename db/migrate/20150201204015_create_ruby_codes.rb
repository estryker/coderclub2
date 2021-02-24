class CreateRubyCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :ruby_codes do |t|
      t.string :url_id
      t.text :code
      t.string :code_hash

      t.timestamps
    end
  end
end
