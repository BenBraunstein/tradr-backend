class TradesController < ApplicationController
  def index
    pending_trades = Trade.all.where(status: "pending")
    render json: pending_trades
  end

  def create
    trade = Trade.create(strong_trade_params)
    trade.update(requester_id: Item.find(trade.requester_item).user_id, acceptor_id: Item.find(trade.acceptor_item).user_id)

    # Twilio API
    acceptor = User.find(trade.acceptor_id)
    requester = User.find(trade.requester_id)
    require "twilio-ruby"
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = "+16313337995"
    to = "5164778178"
    client.messages.create(
      from: from,
      to: to,
      body: "\nHey there #{acceptor.username}!\n#{requester.username} has proposed to trade his #{Item.find(trade.requester_item).name} for your #{Item.find(trade.acceptor_item).name}\nPlease Respond ASAP!\n-Tradr",
      media_url: [Item.find(trade.requester_item).image],
    )

    render json: trade
  end

  def acceptOffer
    trade = Trade.find(params[:id])
    Item.find(trade.requester_item).update(user_id: trade.acceptor_id)
    Item.find(trade.acceptor_item).update(user_id: trade.requester_id)
    trade.update(status: "complete")
    # Cancel all other trades
    trades_to_cancel = Trade.where(status: "pending").select { |otherTrade| trade.acceptor_item == otherTrade.acceptor_item || trade.acceptor_item == otherTrade.requester_item || trade.requester_item == otherTrade.acceptor_item || trade.requester_item == otherTrade.requester_item }
    trades_to_cancel.each { |otherTrade| otherTrade.update(status: "cancelled") }
    pending_trades = Trade.where(status: "pending")
    render json: pending_trades
  end

  def declineOffer
    trade = Trade.find(params[:id])
    trade.update(status: "declined")
    render json: trade
  end

  def nudge
    trade = Trade.find(params[:id])
    acceptor = User.find(trade.acceptor_id)
    requester = User.find(trade.requester_id)

    require "twilio-ruby"
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = "+16313337995"
    to = "5164778178"
    client.messages.create(
      from: from,
      to: to,
      body: "\nHey there #{acceptor.username}!\nJust giving you a friendly reminder that #{requester.username} is waiting for your response to trade their #{Item.find(trade.requester_item).name} for your #{Item.find(trade.acceptor_item).name}.\n-Tradr",
    )
    render json: trade
  end

  private

  def strong_trade_params
    params.require(:trade).permit(:requester_item, :acceptor_item, :status)
  end
end
