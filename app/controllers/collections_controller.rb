class CollectionsController < ApplicationController
  def new
    @collection = Collection.new 
  end

  def show
    @all_collections = current_user.collections
  end

  def edit
  end

  def create
    @collection = current_user.collections.new(collection_params)
    @collection.save
    redirect_to collections_show_path
  end
  
  def collection_params
    params.require(:collection).permit(:user_id,:object ,:name)
    end
end
