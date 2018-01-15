class V1::ConcertsController < ApplicationController
  def index
    render json: Concert.all.as_json
  end

  def show
    concert = Concert.find(params[:id])
    render json: concert.as_json
  end

  def create
    concert = Concert.new(
      name: params[:name],
      date: DateTime.strptime(params[:date], "%m/%d/%Y"),
      duration: params[:duration].to_i,
      cost: params[:cost].to_f
    )

    if concert.save
      render json: concert.as_json
    else
      p '-' * 100
      p concert.errors
      p concert.errors.full_messages
      render json: { error: concert.errors.full_messages }
    end
  end

  def destroy
    concert = Concert.find(params[:id]).destroy
    if concert
      render json: { message: "#{concert.name} concert deleted" }
    else
      render json: { error: concert.errors.full_messages }
    end
  end
end
