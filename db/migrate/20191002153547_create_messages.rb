class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :author
      t.string :kind
      t.string :content

      t.timestamps
    end
  end
end
