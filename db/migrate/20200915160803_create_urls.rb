class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :original_url
      t.string :short_url
      t.integer :click
      t.string :password

      t.timestamps
    end
  end
end
