class AddAcceptorIdAndRequesterIdToTrades < ActiveRecord::Migration[5.2]
  def change
    add_column :trades, :acceptor_id, :integer
    add_column :trades, :requester_id, :integer
  end
end
