class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :ensure_admin, only: [:new, :edit, :create, :update, :destroy]

  # GET /events
  def index
    @events = Event.order(year: :desc)
  end

  # GET /events/1
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private
    def ensure_admin
      super || return
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id]) rescue not_found
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      ret = params.require(:event).permit(:title, :subtitle, :description, :year, :logo)
      if ret.has_key? :logo
        ret[:logo] = convert(ret[:logo])
      end
      return ret
    end

    #parse file name to get the extension
    def get_extension(file_name)
      file_name.split('.').last
    end

    #Converting an uploaded image into Base64 String
    def convert(file)
      prefix = "data:image/" + get_extension(file.original_filename) + ";base64,"
      prefix + Base64.strict_encode64(file.open.read)
    end
end
