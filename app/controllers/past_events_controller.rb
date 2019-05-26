class PastEventsController < ApplicationController
  before_action :set_past_event, only: [:show, :edit, :update, :destroy]
  before_action :ensure_admin, only: [:new, :edit, :create, :update, :destroy]

  # GET /past_events
  def index
    @past_events = PastEvent.order(year: :desc)
  end

  # GET /past_events/1
  def show
  end

  # GET /past_events/new
  def new
    @past_event = PastEvent.new
  end

  # GET /past_events/1/edit
  def edit
  end

  # POST /past_events
  def create
    @past_event = PastEvent.new(past_event_params)

    if @past_event.save
      redirect_to @past_event, notice: 'Past event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /past_events/1
  def update
    if @past_event.update(past_event_params)
      redirect_to @past_event, notice: 'Past event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /past_events/1
  def destroy
    @past_event.destroy
    redirect_to past_events_url, notice: 'Past event was successfully destroyed.'
  end

  private
    def ensure_admin
      super || return
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_past_event
      @past_event = PastEvent.find(params[:id]) rescue not_found
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def past_event_params
      ret = params.require(:past_event).permit(:title, :subtitle, :description, :year, :logo)
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
