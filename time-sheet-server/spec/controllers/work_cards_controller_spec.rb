require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe WorkCardsController do

  @work_card

  before do
#    WorkCard.delete_all
  end

  after do
    WorkCard.delete_all
  end

  # This should return the minimal set of attributes required to create a valid
  # WorkCard. As you add validations to WorkCard, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "start_at" => "", "end_at" => "", "pause" => ""} }
  let(:valid_attributes_2) { { "start_at" => "2014-03-01 12:31:00", "end_at" => "", "pause" => "" } }
  let(:atributes_for_start_at_now) { { "start_at" => Time.now() } }
  let(:work_card_id) { valid_attributes.to_param }

  let(:valid_work_card) { double(:work_card, valid_attributes) }
  let(:started_work_card) { double(WorkCard, {:started? => true})}
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # WorkCardsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let (:mock_model_with_find) { WorkCard.should receive(:find).with(@work_card.to_param).and_return(@work_card) }
  let (:mock_attempt_to_save_invalid_data) { WorkCard.any_instance.stub(:save).and_return(false) }


  describe "GET index" do
    it "assigns all work_cards as @work_cards" do
      @work_card=valid_work_card
      work_cards = [@work_card]
      WorkCard.should receive(:all).and_return(work_cards)
      get :index, {}, valid_session
      expect(assigns(:work_cards)).to eq(work_cards)
    end
  end

  describe "GET show" do
    it "assigns the requested work_card as @work_card" do
      @work_card=valid_work_card
      mock_model_with_find
      get :show, {:id => @work_card.to_param}, valid_session
      assigns(:work_card).should eq(@work_card)
    end
  end

  describe "GET new" do
    it "assigns a new work_card as @work_card" do
      get :new, {}, valid_session
      assigns(:work_card).should be_a_new(WorkCard)
    end
  end

  describe "GET edit" do
    it "assigns the requested work_card as @work_card" do
      @work_card=valid_work_card
      mock_model_with_find
      get :edit, {:id => @work_card.to_param}, valid_session
      assigns(:work_card).should eq(@work_card)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new WorkCard and assignes it as @work_card" do #I do not know, how to decompose it into two seperate tests?
        @work_card=valid_work_card
        WorkCard.should receive(:new).and_return(@work_card)
        @work_card.should receive(:save).once
        post :create, {:work_card => valid_attributes}, valid_session
        assigns(:work_card).should be(@work_card)
      end

=begin
      it "assigns a newly created work_card as @work_card" do
        @work_card=valid_work_card
        WorkCard.should receive(:new).and_return(@work_card)
        post :create, {:work_card => valid_attributes}, valid_session
        assigns(:work_card).should be_a(WorkCard)
        assigns(:work_card).should be_persisted
      end
=end

      it "redirects to the created work_card" do #I do not know, how to use mocks here?
        post :create, {:work_card => valid_attributes}, valid_session
        response.should redirect_to(WorkCard.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved work_card as @work_card" do
        # Trigger the behavior that occurs when invalid params are submitted
        mock_attempt_to_save_invalid_data
        post :create, {:work_card => { "start_at" => "invalid value" }}, valid_session
        assigns(:work_card).should be_a_new(WorkCard)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        mock_attempt_to_save_invalid_data
        post :create, {:work_card => { "start_at" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested work_card" do
        @work_card=valid_work_card
        mock_model_with_find
        @work_card.should_receive(:update).with(valid_attributes_2)
        put :update, {:id => @work_card.to_param, :work_card => valid_attributes_2}, valid_session
      end

      it "assigns the requested work_card as @work_card" do
        @work_card=valid_work_card
        mock_model_with_find
        @work_card.should_receive(:update).with(valid_attributes_2)
        put :update, {:id => @work_card.to_param, :work_card => valid_attributes_2}, valid_session
        assigns(:work_card).should eq(@work_card)
      end

      it "redirects to the work_card" do  #I do not know, how to use mocks here?
        @work_card = WorkCard.create! valid_attributes
        put :update, {:id => @work_card.to_param, :work_card => valid_attributes_2}, valid_session
        response.should redirect_to(@work_card)
      end
    end

    describe "with invalid params" do
      it "assigns the work_card as @work_card" do
        @work_card=valid_work_card
        mock_model_with_find
        @work_card.should_receive(:update).with({ "start_at" => "invalid value" })
        # Trigger the behavior that occurs when invalid params are submitted
        mock_attempt_to_save_invalid_data

        put :update, {:id => @work_card.to_param, :work_card => { "start_at" => "invalid value" }}, valid_session
        assigns(:work_card).should eq(@work_card)
      end

      it "re-renders the 'edit' template" do
        @work_card=valid_work_card
        mock_model_with_find
        @work_card.should_receive(:update).with({ "start_at" => "invalid value" })
        # Trigger the behavior that occurs when invalid params are submitted
        mock_attempt_to_save_invalid_data
        put :update, {:id => @work_card.to_param, :work_card => { "start_at" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested work_card" do
      @work_card=valid_work_card
      mock_model_with_find
      @work_card.should_receive(:destroy)
      delete :destroy, {:id => @work_card.to_param}, valid_session
    end

    it "redirects to the work_cards list" do
      @work_card=valid_work_card
      mock_model_with_find
      @work_card.should_receive(:destroy)
      delete :destroy, {:id => @work_card.to_param}, valid_session
      response.should redirect_to(work_cards_url)
    end
  end

  describe "PUT start" do
    before do
      @t=Time.now()
      Time.stub(:now).and_return(@t)
    end

    describe "for non-existing work_card" do
      it "creates a new WorkCard wit start_at set to Time.now() and assignes it as @work_card" do
        @work_card=valid_work_card
        WorkCard.should receive(:new).and_return(@work_card)
        @work_card.should receive(:update).with(atributes_for_start_at_now).once
        allow(@work_card).to receive(:started?).and_return(false)
        put :start, valid_session
        assigns(:work_card).should be(@work_card)
      end

      it "redirects to the newly created work_card" do  #I do not know, how to use mocks here?
        put :start, valid_session
        response.should redirect_to(WorkCard.last)
      end
    end

    describe "for existing blank work_card" do
      it "assigns the requested work_card as @work_card and sets start_at to Time.now" do
        @work_card=valid_work_card
        mock_model_with_find
        allow(@work_card).to receive(:started?).and_return(false)
        @work_card.should_receive(:update).with(atributes_for_start_at_now).once
        put :start, {:id => @work_card.to_param}, valid_session
        assigns(:work_card).should eq(@work_card)
      end
      it "does not create any new work_card" do
        @work_card=valid_work_card
        mock_model_with_find
        allow(@work_card).to receive(:started?).and_return(false)
        @work_card.stub(:update)
        WorkCard.should_not receive(:new)
        put :start, {:id => @work_card.to_param}, valid_session
      end
      it "redirects to the work_card" do  #I do not know, how to use mocks here?
        @work_card = WorkCard.create!
        allow(@work_card).to receive(:started?).and_return(false)
        put :start, {:id => @work_card.to_param}, valid_session
        response.should redirect_to(@work_card)
      end

#      it "can be accessed by /work_card/[:id]/start" do
 #       expect(put("/work_cards/1/start")).to route_to(:controller => "work_cards", :action => "start", :id => 1)
  #    end
    end

    describe "for existing started work_card" do
      it "assignes the requested work_card as @work_card" do
        @work_card=started_work_card
        WorkCard.should receive(:find).with(@work_card.to_param).and_return(@work_card)
        errors = double(ActiveModel::Errors)
        allow(errors).to receive(:add)
        allow(@work_card).to receive(:errors).and_return(errors)
        @work_card.stub(:update)
        put :start, {:id => @work_card.to_param}, valid_session
        assigns(:work_card).should eq(@work_card)
      end

      it "does not save nor update a work_card" do
        @work_card=started_work_card
        mock_model_with_find
        errors = double(ActiveModel::Errors)
        allow(errors).to receive(:add)
        allow(@work_card).to receive(:errors).and_return(errors)

        @work_card.should_not receive(:update)
        @work_card.should_not receive(:save)

        put :start, {:id => @work_card.to_param}, valid_session
      end

      it "redirects to the work_card" do  #I do not know, how to use mocks here?
        @work_card = WorkCard.create!
        allow(@work_card).to receive(:started?).and_return(true)
        put :start, {:id => @work_card.to_param}, valid_session
        response.should redirect_to(@work_card)
      end
    end
  end

end
