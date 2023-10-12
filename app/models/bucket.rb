class Bucket < ApplicationRecord
    has_many :tasks


    def self.get_by_status(status)
        self.all.select do |bucket|
            bucket.status == status
        end
    end 

    
end
