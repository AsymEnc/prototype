class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:help, :about]
  def main
    @query = Document.search do
      fulltext params[:search]
      paginate :page => params[:page], :per_page => 15
    end
    @documents = @query.results
  end

  def help
  end

  def about
  end
end
