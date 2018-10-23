require "rails_helper"

RSpec.describe DisbursementsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/disbursements").to route_to("disbursements#index")
    end
  end
end
