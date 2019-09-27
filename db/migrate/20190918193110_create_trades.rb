class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.integer :requester_item
      t.integer :acceptor_item
      t.string :status

      t.timestamps
    end
  end
end
