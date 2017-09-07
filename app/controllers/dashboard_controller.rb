class DashboardController < ApplicationController
  
  def index
    if params[:visitor_id].blank?
      
    else
      @visitor = Visitor.find(params[:visitor_id])
    end
  end

end