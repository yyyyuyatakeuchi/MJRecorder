class CalculationController < ApplicationController
  def top
    @matchs = params[:matchs].to_i
  end

  def calculate
    @score_total = 0
    @cal = "( "
    @matchs = params[:matchs].to_i
    @matchs.times do |n|
      score = params[:number]["#{n+1}"].to_i
      @score_total += score
      score = "(#{score})" if score < 0
      @cal += (score.to_s + "+" )
    end
    @result_total = @score_total - 250 * @matchs
    @cal.chop!
    @cal += " ) ー ( 250×#{@matchs} )"
    render :top
  end
end
