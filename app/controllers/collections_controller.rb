class CollectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_collection , only: [:show, :edit, :update, :destroy, :returnID]
  
  def new
    @collection = Collection.new 
  end

  def show
    
    if current_user.id != @collection.user_id
      flash.now[:alert] = "*** Cannot Edit Others Collections ***"
    end
    @elements = Element.all
  end

  def index 
    @all_collections = current_user.collections
  end 
  
  def edit
  end

  def create
    @collection = current_user.collections.new(collection_params)
    @collection.save
    redirect_to collections_path
  end
  
  def update
    @collection.update(collection_params)
    redirect_to collections_path
  end
  
  def destroy
    @collection.destroy
    redirect_to collections_path
  end

  def returnID
    @coll_id = @collection
  end
  
  private
    def set_collection
     
        @collection = Collection.find(params[:id])
      
    end
  
    def collection_params
      params.require(:collection).permit(:user_id,:object ,:name, :personal,:description)
    end
    
  
end
