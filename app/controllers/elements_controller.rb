class ElementsController < ApplicationController
  before_action :set_element, only: [:show, :edit, :update, :destroy]
  
  @coll_id
  @colhelp
  
  def index
  end

  def show
    @colhelp
  end
  
  def create
    element = Collection.Element.new(element_params)
    element.save
    @colhelp = Collection.find(element.collection_id).name
    redirect_to element_path(element.id)
  end
  
  
  
  def edit
    @colhelp 
  end

  def new
    @element = Element.new
    
  
    
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