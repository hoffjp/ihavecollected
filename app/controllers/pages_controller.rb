class PagesController < ApplicationController
  
  
  def show
    @collections = Collection.all
    if current_user
      @user_col = current_user.collections
    end
  end
end
