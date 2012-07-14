require 'spec_helper'

describe EventsController do

  # This should return the minimal set of attributes required to create a valid
  # Event. As you add validations to Event, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    FactoryGirl.attributes_for :event
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EventsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all events as @events" do
      events = [mock_model(Event)]
      Event.stub(:all).and_return(events)
      get :index, {}, valid_session
      assigns(:events).should eq(events)
    end
  end

  describe "GET show" do
    it "assigns the requested event as @event" do
      event = mock_model(Event)
      Event.stub(:find).and_return(event)
      get :show, {:id => event.id}, valid_session
      assigns(:event).should eq(event)
    end
  end

  describe "GET new" do
    it "assigns a new event as @event" do
      get :new, {}, valid_session
      assigns(:event).should be_a_new(Event)
    end
  end

  describe "GET edit" do
    it "assigns the requested event as @event" do
      event = mock_model(Event)
      Event.stub(:find).and_return(event)
      get :edit, {:id => event.id}, valid_session
      assigns(:event).should eq(event)
    end
  end

  describe "POST create" do

    let(:event) { mock_model(Event).as_null_object }

    before(:each) do
      Event.stub(:new).and_return(event)
    end

    it "assigns a newly created event as @event" do
      post :create, {:event => valid_attributes}, valid_session
      assigns(:event).should eq(event)
    end

    context "when saving succeeds" do
      before(:each) do
        event.stub(:save).and_return(true)
      end

      it "redirects to the created event" do
        post :create, {:event => valid_attributes}, valid_session
        response.should redirect_to(event)
      end
    end

    context "when saving fails" do
      before(:each) do
        event.stub(:save).and_return(false)
      end

      it "re-renders the 'new' template" do
        post :create, {:event => {}}, valid_session
        response.should render_template("new")
      end
    end
  end


  describe "PUT update" do

    let(:event) { mock_model(Event).as_null_object }

    before(:each) do
      Event.stub(:find).and_return(event)
    end

    it "assigns the requested event as @event" do
      put :update,
        {:id => event.to_param, :event => valid_attributes},
        valid_session
      assigns(:event).should eq(event)
    end

    context "when updating succeeds" do
      before(:each) do
        event.stub(:update_attributes).and_return(true)
      end

      it "redirects to the updated event" do
        put :update,
          {:id => event.to_param, :event => valid_attributes},
          valid_session
        response.should redirect_to(event)
      end
    end

    context "when updating fails" do
      before(:each) do
        event.stub(:update_attributes).and_return(false)
      end

      it "re-renders the 'edit' template" do
        put :update,
          {:id => event.to_param, :event => valid_attributes},
          valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    let(:event) { mock_model(Event).as_null_object }

    before(:each) do
      Event.should_receive(:find).and_return(event)
    end

    it "assigns the requested event as @event" do
      delete :destroy, {:id => event.to_param}, valid_session
      assigns(:event).should eq(event)
    end

    it "destroys the requested event" do
      event.should_receive(:destroy)
      delete :destroy, {:id => event.to_param}, valid_session
    end

    it "redirects to the events list" do
      delete :destroy, {:id => event.to_param}, valid_session
      response.should redirect_to(events_url)
    end
  end

  describe "PUT select" do

    let(:event) { mock_model(Event).as_null_object }
    let(:option) { mock_model(Option).as_null_object }

    before(:each) do
      Event.stub(:find).and_return(event)
    end

    it "assigns the requested event as @event" do
      put :select, {:id => event.id, :option_id => option.id}, valid_session
      assigns(:event).should eq(event)
    end

    it "calls select on the event with the given option id" do
      event.should_receive(:select).with("#{option.id}")
      put :select, {:id => event.id, :option_id => option.id}, valid_session
    end

    context "when updating succeeds" do
      before(:each) do
        event.stub(:save).and_return(true)
      end

      it "redirects to the updated event" do
        put :select, {:id => event.id, :option_id => option.id}, valid_session
        response.should redirect_to(event)
      end
    end

    context "when updating fails" do
      before(:each) do
        event.stub(:save).and_return(false)
      end

      it "re-renders the 'show' template" do
        put :select, {:id => event.id, :option_id => option.id}, valid_session
        response.should render_template("show")
      end
    end
  end

  describe "PUT unselect" do

    let(:event) { mock_model(Event).as_null_object }

    before(:each) do
      Event.stub(:find).and_return(event)
    end

    it "assigns the requested event as @event" do
      put :unselect, {:id => event.id}, valid_session
      assigns(:event).should eq(event)
    end

    it "calls unselect on the event" do
      event.should_receive(:unselect)
      put :unselect, {:id => event.id}, valid_session
    end

    context "when updating succeeds" do
      before(:each) do
        event.stub(:save).and_return(true)
      end

      it "redirects to the updated event" do
        put :unselect, {:id => event.id}, valid_session
        response.should redirect_to(event)
      end
    end

    context "when updating fails" do
      before(:each) do
        event.stub(:save).and_return(false)
      end

      it "re-renders the 'show' template" do
        put :unselect, {:id => event.id}, valid_session
        response.should render_template("show")
      end
    end
  end

end
