class CalculationController < ApplicationController
  def top
    @rates = params[:rates].to_f
    @matchs = params[:matchs].to_i
    @basePoints = params[:basePoints].to_i
  end

  def matchCount
    @matchs = params[:id].to_i
    @rank = []
    render :top
  end

  def calculate
    @score_total = 0
    @score_record = []
    @rank = []
    @cal_formula = "( "
    @matchs = params[:matchs].to_i
    @rates = params[:rates].to_f
    @basePoints = params[:basePoints] ? params[:basePoints].to_i : 250
    @matchs.times do |n|
      score = params[:number]["#{n+1}"].to_i
      rank = params["rank_#{n+1}"].to_i
      @score_total += score
      @score_record << score
      @rank << rank
      score = "(#{score})" if score < 0
      @cal_formula += (score.to_s + "+" )
    end
    @difference = 25000 / @basePoints
    @result_total = @score_total - @basePoints * @matchs
    @result = @result_total * @difference * @rates
    @result = @result.to_i
    @cal_formula.chop!
    @cal_formula += " ) ー ( #{@basePoints}×#{@matchs} )"
    #@cal += " = ( #{@score_total} ) - #{250 * @matchs}"
    render :top
  end
end
