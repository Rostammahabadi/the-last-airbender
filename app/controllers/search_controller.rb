class SearchController < ApplicationController
  def index
    @members = AirbenderDecorator.new(params[:nation]).list_of_members
    @nation = params[:nation].split("_").join(" ")
  end

end
