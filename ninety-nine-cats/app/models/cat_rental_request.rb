# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :bigint           not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CatRentalRequest < ApplicationRecord
    validates :start_date, :end_date, :status, presence: :true
    validates :status, inclusion: { in: ['PENDING','APPROVED','DENIED']}
    validate :does_not_overlap_approved_request
    belongs_to :cat

    def overlapping_requests
        #We need the current cat's requests. 
        #"Self" is a catrentalrequest, it has a cat_id and a start/end.
        # Need to check if any other of that cat's rental requests overlap with the current request
        # We are starting with a Start and End.
        # 
        CatRentalRequest.where("cat_id = ?",cat_id).
        where("start_date BETWEEN ? AND ? OR end_date BETWEEN ? AND ?",start_date,end_date,start_date,end_date)
    end 

    def overlapping_approved_requests 
        self.overlapping_requests.where(status: 'APPROVED')
    end 

    def does_not_overlap_approved_request
        if overlapping_approved_requests.exists?
            errors.add(:start_date,"is not a valid date")
        end
    end
            
end
