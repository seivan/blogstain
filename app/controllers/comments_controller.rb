class CommentsController < ApplicationController
  def create
    commentable = find_commentable
    @comment = commentable.comments.build(params[:comment])
    #@comment = Comment.create(params[:comment])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to commentable }
        #format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "index", :controller =>"posts" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end


  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@comment, :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end


def find_commentable
  params.each do |name, value|
    if name =~ /(.+)_id$/
      return $1.classify.constantize.find(value)
    end
  end
  nil
end
end
