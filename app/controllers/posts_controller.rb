class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  # before_action :authenticate_user!, only: %i[ edit update destroy ]
  before_action :check_information, only: %i[ create new edit update destroy ]


  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end


  # GET /posts/new
  def new
    @post = Post.new
    @post.user_id = params[:user_id]
    if params[:is_job] == 'user'
      @post.is_job = false
    else
      @post.is_job = true
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: "Post was successfully created." }
        format.json { head :no_content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to root_path, notice: "Post was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Post was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      if params[:id]
        @post = Post.find(params[:id])
      else
        @post = Post.find_by({slug:params[:slug]})
      end
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :slug, :description, :banner, :starting_price, :user_id, :fields, :is_job)
    end
end

private
# Use callbacks to share common setup or constraints between actions.
def check_information

  profile = Profile.find_by({user_id: seller_signed_in? ? current_seller.id : current_user.id})
  if profile == nil
    respond_to do |format|
      format.html { redirect_to root_path, notice: "You have to update your profile before doing this action!." }
      format.json { head :no_content }
    end
  end
end

