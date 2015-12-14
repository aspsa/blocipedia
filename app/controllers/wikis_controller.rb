class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end
  
  def create
    @wiki = Wiki.new(wiki_params)
    
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash[:error] = "Wiki was not saved."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    
    if @wiki.update_attributes(wiki_params)
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash[:error] = "Wiki was not updated."
      render :edit
    end
  end
  
  def destroy
    @wiki = Wiki.find(params[:id])
    
    if @wiki.destroy
      flash[:notice] = "Wiki was deleted."
      redirect_to @wiki
    else
      flash[:error] = "Wiki was not deleted."
      redirect_to @wiki
    end
  end
  
  private
  
    def wiki_params
      params.require(:wiki).permit(:title, :body)
    end
end