class MypageController < ApplicationController
  before_action :authenticate_user!

  def show
    @records = ScoreSetting.where(user_id: current_user.id).order(created_at: "DESC")
  end
end
