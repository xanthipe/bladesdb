class Approval < ActiveRecord::Base

    belongs_to :approvable

    after_update :attempt_overall_approve, unless: :approvable_rejected?

    validates_presence_of :role_id
    validates_presence_of :approvable_id
    validates_presence_of :approvable_type
    validates_presence_of :approved_on, :unless => "approved.nil?"
    validates_presence_of :approved_by, :unless => "approved.nil?"
    validates_presence_of :rejection_reason, :if => "approved == false"

    def self.outstanding_approvals(current_user)
      approvals.where(approved: nil, role_id: current_user.roles.id.to_a).joins.approvable.where.not(overall_decision_status: false).where.not(user_id: current_user.id)
        # Any Approval where approved.nil? and user has role_id, thing is not rejected, and user doesn't own the thing
    end

    private

    def attempt_overall_approve
      unless self.approvable.approvals.not.where(approved: true).exists?
        self.approvable.overall_approve
      end
    end

    def approvable_rejected?
      self.approvable.is_rejected?
    end

end
