class EventsController < ApplicationController

  before_filter :load_event, except: [:index, :create, :new]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html do
          redirect_to @event, notice: 'Event was successfully created.'
        end
        format.json do
          render json: @event, status: :created, location: @event
        end
      else
        format.html do
          render "new"
        end
        format.json do
          render json: @event.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html do
          redirect_to @event, notice: 'Event was successfully updated.'
        end
        format.json do
          head :no_content
        end
      else
        format.html do
          render "edit"
        end
        format.json do
          render json: @event.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  # PUT /events/1/select/2
  # PUT /events/1/select/2.json
  def select
    @event.select(params[:option_id])

    respond_to do |format|
      if @event.save
        format.html do
          redirect_to @event, notice: 'Option was successfully selected.'
        end
        format.json do
          head :no_content
        end
      else
        format.html do
          render "show"
        end
        format.json do
          render json: @event.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PUT /events/1/unselect
  # PUT /events/1/unselect
  def unselect
    @event.unselect

    respond_to do |format|
      if @event.save
        format.html do
          redirect_to @event, notice: 'Option was successfully unselected.'
        end
        format.json do
          head :no_content
        end
      else
        format.html do
          render "show"
        end
        format.json do
          render json: @event.errors, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def load_event
    @event = Event.find(params[:id])
  end

end
