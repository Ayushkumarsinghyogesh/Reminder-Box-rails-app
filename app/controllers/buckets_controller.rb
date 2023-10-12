class BucketsController < ApplicationController

    def new
        @bucket = Bucket.new
    end 
    
end
