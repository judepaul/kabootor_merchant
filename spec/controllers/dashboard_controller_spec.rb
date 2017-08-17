require 'spec_helper'

describe DashboardController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'start_exploring'" do
    it "returns http success" do
      get 'start_exploring'
      response.should be_success
    end
  end

end
