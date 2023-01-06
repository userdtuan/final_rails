class HomeController < ApplicationController
    def index
        a = 'asdsd'
        logger.debug "\n\n\nDebug: #{a}\n\n\n"
    end 
end
