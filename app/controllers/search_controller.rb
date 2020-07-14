class SearchController < ApplicationController
  def index
    binding.pry
    @members = AirbenderDecorator.new(params[:nation]).list_of_members
  end

end
