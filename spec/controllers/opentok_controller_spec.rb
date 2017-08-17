require 'spec_helper'

describe OpentokController do

  describe "GET 'start'" do
    it "returns http success" do
      get 'start'
      response.should be_success
    end
  end

  describe "GET 'stop'" do
    it "returns http success" do
      get 'stop'
      response.should be_success
    end
  end

  describe "GET 'upload_response'" do
    it "returns http success" do
      get 'upload_response'
      response.should be_success
    end
  end

end
