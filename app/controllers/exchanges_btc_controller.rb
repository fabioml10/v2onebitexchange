class ExchangesBtcController < ApplicationController
  def index
  end

  def convert
    value = ExchangeBtcService.new(params[:source_currency], params[:target_currency], params[:amount]).perform
    render json: {"value": value}
  end
end
