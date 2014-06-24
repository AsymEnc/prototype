class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:help, :about]
  def main
    @documents = Document.all
    
  end

  def help
  end

  def about
  end
end
