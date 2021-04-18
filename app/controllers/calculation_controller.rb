class CalculationController < ApplicationController
  def top
    @rate = params[:rate].to_f
    @match_count = params[:match_count].to_i
    @basePoint = params[:basePoint].to_i
  end

  def matchCount
    @match_count = params[:id].to_i
    @rank = []
    render :top
  end

  def calculate
    @score_total = 0
    @score_record = []
    @rank = []
    @cal_formula = "( "
    @match_count = params[:match_count].to_i
    @rate = params[:rate].to_f
    @basePoint = params[:basePoint] ? params[:basePoint].to_i : 250
    @match_count.times do |n|
      score = params[:number]["#{n+1}"].to_i
      rank = params["rank_#{n+1}"].to_i
      @score_total += score
      @score_record << score
      @rank << rank
      score = "(#{score})" if score < 0
      @cal_formula += (score.to_s + "+" )
    end
    @difference = 25000 / @basePoint
    @result_total = @score_total - @basePoint * @match_count
    @result_point = @result_total * @difference * @rate
    @result_point = @result_point.to_i
    @cal_formula.chop!
    @cal_formula += " ) ー ( #{@basePoint}×#{@match_count} )"
    #@cal += " = ( #{@score_total} ) - #{250 * @match_count}"
    render :top
  end
end
