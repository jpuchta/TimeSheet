require "spec_helper"

describe WorkCardsController do
  describe "routing" do

    it "routes to #index" do
      get("/work_cards").should route_to("work_cards#index")
    end

    it "routes to #new" do
      get("/work_cards/new").should route_to("work_cards#new")
    end

    it "routes to #show" do
      get("/work_cards/1").should route_to("work_cards#show", :id => "1")
    end

    it "routes to #edit" do
      get("/work_cards/1/edit").should route_to("work_cards#edit", :id => "1")
    end

    it "routes to #create" do
      post("/work_cards").should route_to("work_cards#create")
    end

    it "routes to #update" do
      put("/work_cards/1").should route_to("work_cards#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/work_cards/1").should route_to("work_cards#destroy", :id => "1")
    end

  end
end
