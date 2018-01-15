class V1::ConcertsController < ApplicationController
  def index
    concerts_array = []
    Concert.all.each do |concert|
      concerts_array << {
        id: concert.id,
        name: concert.name,
        date: concert.date,
        duration: concert.duration,
        cost: concert.cost.to_f,
      }
    end
      render json: concerts_array.as_json
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
end
