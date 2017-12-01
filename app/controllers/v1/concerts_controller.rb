class V1::ConcertsController < ApplicationController
  def index
    concerts_array = []
    Concert.all.each do |concert|
      concerts_array << {
        name: concert.name,
        date: concert.date,
        duration: concert.duration,
        cost: concert.cost.to_f,
      }
    end
      render json: concerts_array.as_json
  end
end
