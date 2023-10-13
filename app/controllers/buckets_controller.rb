class BucketsController < ApplicationController
    def index
        @empty_buckets = Bucket.get_by_status("Empty")
        @pending_buckets = Bucket.get_by_status("Pending")
        @completed_buckets = Bucket.get_by_status("Completed")
    end

    def new
        @bucket = Bucket.new
    end

    def create
        @bucket = Bucket.create(bucket_params(:name, :description))
        @bucket.status = "Empty"
        @bucket.save
        redirect_to bucket_path(@bucket)
    end

    def show
        @bucket = Bucket.find(params[:id])
    end

    def edit
        @bucket = Bucket.find(params[:id])
    end

    def update
        @bucket = Bucket.find(params[:id])
        @bucket.update(bucket_params(:name, :description))
        @bucket.update_status
        redirect_to bucket_path(@bucket)
    end

    def destroy
        @bucket = Bucket.find(params[:id]).destroy
        redirect_to buckets_path
    end

    private
    def bucket_params(*args)
        params.require(:bucket).permit(*args)
    end
end