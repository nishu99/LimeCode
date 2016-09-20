class CreateParseContents < ActiveRecord::Migration
  def change
    create_table :parse_contents do |t|
      t.string :url
      t.text :content

      t.timestamps null: false
    end
  end
end
