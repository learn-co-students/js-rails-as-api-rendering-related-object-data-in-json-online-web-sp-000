class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: @birds
    #done
  end
end