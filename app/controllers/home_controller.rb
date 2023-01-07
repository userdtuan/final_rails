class HomeController < ApplicationController
    def index
        @page = params[:page] || 1
        @per_page = 4
        offset = (@page.to_i - 1) * @per_page
        @jobs = Post.offset(offset).limit(@per_page).where(is_job:true)
    end 
end
