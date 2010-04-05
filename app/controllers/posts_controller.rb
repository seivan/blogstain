class PostsController < ApplicationController
  load_and_authorize_resource
  
  def index
    respond_to do |format|
      format.html {render :index}
      format.json {render :json=>@posts.to_json}
    end
  end
  
  def show
    respond_to do |format|
      format.html {render :show}
      format.json {render :json=>@post.to_json}
    end
  end
  

end
