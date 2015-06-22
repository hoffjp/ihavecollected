class ElementsController < ApplicationController
  before_action :set_element, only: [:show, :edit, :update, :destroy]
  
  @coll_id
  @colhelp
  
  def index
  end

  def show
    @collection = Collection.find(params[:collection_id])
  end
  
  def create
    @element = Element.new(element_params)
    @element.collection_id = params[:collection_id]
    @element.save
    @colhelp = Collection.find(@element.collection_id)
    redirect_to collection_element_path(@colhelp , @element.id)
  end
  
  
  
  def edit
    @collection = Collection.find(params[:collection_id])
  end

  def new

    #throw params
    
    @col = Collection.find(params[:collection_id])
    @element = Element.new
    @element.collection_id = params[:collection_id]
    
  end

  def destroy
    @id = @element.collection_id
    @element.destroy
    redirect_to collections_path(@id)
  end
  
  def update
    @element.update(element_params)
    redirect_to collection_path(@element.collection_id)
  end
  
end
  private
    def element_params
      params.require(:element).permit(:collection_id,:name )
    end

   def set_element  
      @element = Element.find(params[:id])  
   end