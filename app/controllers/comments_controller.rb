class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    post = Post.find(params[:post_id])
    @comments = post.comments

    respond_to do |format|
      format.html
      format.xml { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    post = Post.find(params[:post_id])
    @comment = post.comments.find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render :xml => @comment }
    end
  end

  # GET /comments/new
  def new
    post = Post.find(params[:post_id])
    @comment = post.comments.build

    respond_to do |format|
      format.html
      format.xml { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    post = Post.find(params[:post_id])
    @comment = post.comments.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.create(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to([@comment.post, @comment], :notice => 'Comment successfully created.') }
        format.xml { render :xml => @comment, :status => :created, :location => [@comment.post, @comment] }
      else
        format.html { render :action => 'new' }
        format.xml { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    post = Post.find(params[:post_id])
    @comment = post.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to([@comment.post, @comment], :notice => 'Comment was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    post = Post.find(params[:post_id])
    @comment = post.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(post_comments_url)}
      format.xml { head :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:commenter, :body, :post_id, :post)
    end
end
