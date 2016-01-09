class WikisController < ApplicationController
  def index
    #@wikis = Wiki.all
    @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
    @users = User.all
  end

  def new
    @wiki = Wiki.new
    
    authorize @wiki
  end
  
  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user
    
    authorize @wiki
    
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
    @users = User.all
    
    authorize @wiki
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    
    authorize @wiki
    
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
    
    authorize @wiki
    
    if @wiki.destroy
      flash[:notice] = "Wiki was deleted."
      redirect_to @wiki
    else
      flash[:error] = "Wiki was not deleted."
      redirect_to @wiki
    end
  end
  
  def is_private?
    self.private
  end
  
  def add_collaborator
    #@wiki = Wiki.find(params[:id])
    
    #@wiki.users.Collaborator.create()
  end
  
  private
  
    def wiki_params
      params.require(:wiki).permit(:title, :body, :private)
    end
end