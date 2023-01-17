class HomeController < ApplicationController
    before_action :authenticate_seller!, only: %i[freelancer_page]
    before_action :pagination
    def index
        @total_jobs = Post.where(is_job:true)
        @jobs = Post.offset(@offset).limit(@per_page).where(is_job:true)
    end 

    def freelancer_page

    end 

    def search_job
        @category_key = params[:keyword]
        @total_jobs = Post.where("fields Like ?", "%#{@category_key}%")
        @jobs = Post.offset(@offset).limit(@per_page).where("is_job = true and (fields Like ? or title Like ?)", "%#{@category_key}%", "%#{@category_key}%")
    end

    def category_job
        @category_key = params[:keyword]
        @total_jobs = Post.where("fields Like ?", "%#{@category_key}%")
        @jobs = Post.offset(@offset).limit(@per_page).where("is_job = true and fields Like ?", "%#{@category_key}%")
    end

    private
    def pagination
        @page = params[:page] || 1
        @per_page = 4
        @offset = (@page.to_i - 1) * @per_page
    end
end
