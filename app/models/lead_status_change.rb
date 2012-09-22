class LeadStatusChange < ActiveRecord::Base
  attr_accessible :lead, :lead_id, :status, :assigned_to
  
  belongs_to :lead
end
