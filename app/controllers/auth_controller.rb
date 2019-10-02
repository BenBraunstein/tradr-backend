class AuthController < ApplicationController
  def login
    user = User.find_by('lower(username) = ?', params[:username].downcase)
    users_pending_trades = Trade.where(status: "pending").select { |trade| trade.acceptor_id == user.id || trade.requester_id == user.id }
    if user && user.authenticate(params[:password])
      render json: {
               user: user,
               users_pending_trades: users_pending_trades,
               token: JWT.encode({ userId: user.id }, ENV["JWT_SECRET"]),
             }
    else
      render json: { errors: "Invalid username, password combo" }
    end
  end

  def autologin
    token = request.headers["Authorization"].split.last
    if token != "undefined"
      user_id = JWT.decode(token, ENV["JWT_SECRET"])[0]["userId"]
      user = User.find(user_id)
      render json: user
    end
  end
end
