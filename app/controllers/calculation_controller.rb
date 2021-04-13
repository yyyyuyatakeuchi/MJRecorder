class CalculationController < ApplicationController
  def top
    @matchs = params[:matchs].to_i
    @rates = params[:rates].to_i
  end

  def calculate
    @score_total = 0
    @score_record = []
    @cal_formula = "( "
    @matchs = params[:matchs].to_i
    @rates = params[:rates].to_i
    @matchs.times do |n|
      score = params[:number]["#{n+1}"].to_i
      @score_total += score
      @score_record << score
      score = "(#{score})" if score < 0
      @cal_formula += (score.to_s + "+" )
    end
    @result_total = @score_total - 250 * @matchs
    @result = @result_total * 10 * @rates
    @cal_formula.chop!
    @cal_formula += " ) ー ( 250×#{@matchs} )"
    #@cal += " = ( #{@score_total} ) - #{250 * @matchs}"
    render :top
  end
end
