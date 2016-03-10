class Api::V1::EventsController < Api::V1::ApiController
  
  # wget --header="Authorization: Token token=scWTF92WXNiH2WhsjueJk4dN" -S http://localhost:3000/api/v1/events/
  def index
    @events = Event.where("starts_at > ?", Time.now).where.not(volunteers_needed: 0)
    if params[:minimal] 
      render :minimal_index and return
    end
  end


  # wget --header="Authorization: Token token=scWTF92WXNiH2WhsjueJk4dN" -S http://localhost:3000/api/v1/events/1
  def show
    @event = Event.find(params[:id])
    if params[:minimal] 
      render :minimal_show and return
    end
  end
end