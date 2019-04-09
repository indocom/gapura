class PastEventsController < ApplicationController
  before_action :set_past_event, only: [:show, :edit, :update, :destroy]

  # GET /past_events
  # GET /past_events.json
  def index
    @past_events = PastEvent.all
  end

  # GET /past_events/1
  # GET /past_events/1.json
  def show
  end

  # GET /past_events/new
  def new
    ensure_admin || return
    @past_event = PastEvent.new
  end

  # GET /past_events/1/edit
  def edit
    ensure_admin || return
  end

  # POST /past_events
  # POST /past_events.json
  def create
    #fail
    ensure_admin || return
    @past_event = PastEvent.new(past_event_params)

    respond_to do |format|
      if @past_event.save
        format.html { redirect_to @past_event, notice: 'Past event was successfully created.' }
        format.json { render :show, status: :created, location: @past_event }
      else
        format.html { render :new }
        format.json { render json: @past_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /past_events/1
  # PATCH/PUT /past_events/1.json
  def update
    ensure_admin || return
    respond_to do |format|
      if @past_event.update(past_event_params)
        format.html { redirect_to @past_event, notice: 'Past event was successfully updated.' }
        format.json { render :show, status: :ok, location: @past_event }
      else
        format.html { render :edit }
        format.json { render json: @past_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /past_events/1
  # DELETE /past_events/1.json
  def destroy
    ensure_admin || return
    @past_event.destroy
    respond_to do |format|
      format.html { redirect_to past_events_url, notice: 'Past event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_past_event
      @past_event = PastEvent.find(params[:id])
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
