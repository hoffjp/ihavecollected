class PagesController < ApplicationController
  def show
    @collections = Collection.all
  end
end
