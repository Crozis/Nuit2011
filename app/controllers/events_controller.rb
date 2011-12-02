class EventsController < ApplicationController
  
  def vote_up
    @event = Event.find(params[:event_id])
    idea = GiftIdeas.where(:product_id => params[:product_id], :event_id => @event.id).first
    vote = Votes.new
    vote.user_id = current_user.id
    vote.idea_id = idea.id
    vote.vote = 1
    vote.save
    
    respond_to do |format|
      format.html { redirect_to @event }
      format.json { render json: @event }
    end
  end

  def vote_down
    @event = Event.find(params[:event_id])
    idea = GiftIdeas.where(:product_id => params[:product_id], :event_id => @event.id).first
    vote = Votes.new
    vote.user_id = current_user.id
    vote.idea_id = idea.id
    vote.vote = 0
    vote.save
    
    respond_to do |format|
      format.html { redirect_to @event }
      format.json { render json: @event }
    end
  end
  
  def add_product
    g = GiftIdeas.new
    g.date = Date.today
    g.user_id = current_user.id
    g.product_id = Product.find(params[:product_id]).id
    @event = Event.find(params[:event_id])
    g.event_id = @event.id
    g.save
    respond_to do |format|
      format.html { redirect_to @event }
      format.json { render json: @event }
    end

  end
  
  def invite 
    @event = Event.find(params[:event_id])
    UserMailer.send_email(params[:email], @event.victim_name, @event.id).deliver
    respond_to do |format|
      format.html { redirect_to @event }
      format.json { render json: @event }
    end
  end
  
  def subscribe
    @event = Event.find(params[:event_id])
    current_user.events << @event
    respond_to do |format|
      Budget.create(:user => current_user, :event_id => @event.id, :amount => 0)
      format.html { redirect_to @event }
      format.json { render json: @event }
    end
  end

  # GET /events
  # GET /events.json
  def index
    @events = current_user.events
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    if !current_user
      respond_to do |format|
        format.html { redirect_to home_index_path }
        format.json { render json: @event }
      end
    else
      
      @event = Event.find(params[:id])
      @products = GiftIdeas.where(:event_id => @event.id).collect{|gift_idea| Product.find(gift_idea.product_id) }
      @current_user_budget = current_user.event_budget(@event)

      @search = Product.search(params[:search])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @event }
      end
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
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new
    @event.victim_name = params[:event][:victim_name]
    @event.description = params[:event][:description]
    @event.creator = current_user
    respond_to do |format|
      if @event.save
        Budget.create(:user => current_user, :event_id => @event.id, :amount => 0)
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :ok }
    end
  end
end
