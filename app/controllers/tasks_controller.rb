class TasksController < ApplicationController

    def new
        @bucket = Bucket.new
    end

    def create
        @bucket = Bucket.create(bucket_params(:name, :description))
        @bucket.status = "Empty"
        @bucket.save
        redirect_to bucket_path(@bucket)
    end

    
end
