require 'spec_helper'

describe RecordingController do

  describe "GET 'start'" do
    it "returns http success" do
      get 'start'
      response.should be_success
    end
  end

end
