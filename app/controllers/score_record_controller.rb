class ScoreRecordController < ApplicationController
  #before_action :sign_in_user

  def create
    @user = User.find(params[:id])
    render mypage_path(current_user)
  end
end