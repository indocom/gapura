require "rails_helper"

RSpec.describe Admin::FrequentlyAskedQuestionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/admin/frequently_asked_questions").to route_to("admin/frequently_asked_questions#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/frequently_asked_questions/new").to route_to("admin/frequently_asked_questions#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/frequently_asked_questions/1").to route_to("admin/frequently_asked_questions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/frequently_asked_questions/1/edit").to route_to("admin/frequently_asked_questions#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/admin/frequently_asked_questions").to route_to("admin/frequently_asked_questions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/frequently_asked_questions/1").to route_to("admin/frequently_asked_questions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/frequently_asked_questions/1").to route_to("admin/frequently_asked_questions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/frequently_asked_questions/1").to route_to("admin/frequently_asked_questions#destroy", :id => "1")
    end
  end
end
