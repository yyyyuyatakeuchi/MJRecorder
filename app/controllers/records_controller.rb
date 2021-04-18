class RecordsController < ApplicationController
  #before_action :sign_in_user

  def create
    records = current_user.score_settings.build(record_params)
    raw_records = params[:score]
    raw_records = raw_records.split(" ")
    rank = params[:rank]
    rank = rank.split(" ")
    match_count = params[:match_count]
    if records.save
      match_count.to_i.times do |n|
        params[:score] = raw_records[n]
        params[:rank] = rank[n]
        records.raw_scores.create!(raw_record_params)
      end
      flash[:success] = "保存完了"
      redirect_to mypage_path(current_user)
    end
  end

  def destroy

  end

  def record_params
    params.permit(:result_point, :match_count, :rate, :base_point)
  end

  def raw_record_params
    params.permit(:score, :rank)
  end
end