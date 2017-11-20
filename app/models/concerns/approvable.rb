module Approvable
extend ActiveModel::Concern
include ActiveModel::Validations

included do
	has_many :approvals, as: :approvable, dependent: destroy
	belongs_to :user

	validates_presence_of :user_id
	validates_presence_of :declared_on
	validates_presence_of :decision_date, :unless => :is_pending?
	validates_presence_of :overall_decision_status, :unless => :is_pending?

	after_save :set_up_approvals

end

  module ClassMethods

		def set_up_approvals
			delete_approvals
			self.approval_roles.each { |role|
				create_approval(role: role)
			}
		end

		def delete_approvals
			self.approvals.destroy
		end

		def create_approval(role: nil)
			self.approvals.create(role: role)
		end

		def approval_roles
			approval_roles = [Roles.find_by(rolename: "characterref")]
		end

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

    def is_pending?
        self.overall_decision_status == nil
    end

	end

end
