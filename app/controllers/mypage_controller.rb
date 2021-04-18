class MypageController < ApplicationController
  before_action :authenticate_user!

  def show
    @records = ScoreSetting.where(user_id: current_user.id)
    @raw_records = RawScore.all
    @rs = ScoreSetting.first
  end
end
