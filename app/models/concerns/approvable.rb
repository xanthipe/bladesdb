module Approvable
extend ActiveModel::Concern
include ActiveModel::Validations

included do
	has_many :approvals, as: :approvable, dependent: destroy
	belongs_to :user

	validates_presence_of :user_id
	validates_presence_of :declared_on
	validates_presence_of :reason
	validates_presence_of :decision_date, :unless => :is_provisional?
	validates_presence_of :overall_decision_status, :unless => :is_provisional?

end

  module ClassMethods

		def pending_approvals(user)
        approvable.where(user_id: user.id, overall_decision_status: nil)
    end

		def approved_approvals(user)
        approvable.where(user_id: user.id, overall_decision_status: true)
    end

		def rejected_approvals(user)
        approvable.where(user_id: user.id, overall_decision_status: false)
    end

		def is_approved?
        self.overall_decision_status == true
    end

    def is_rejected?
        self.overall_decision_status == false
    end

    def is_provisional?
        self.overall_decision_status == nil
    end

	end

end
