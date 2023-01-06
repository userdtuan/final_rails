class PageController < ApplicationController
    before_action :authenticate_user!, only: %i[ user ]
    def user

    end
end
