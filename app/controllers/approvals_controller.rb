class ApprovalsController < ApplicationController
  before_filter :authenticate_user!

  def approve(current_user)
    approval.approved = true
    approval.approved_by = current_user
    approval.approved_on = Date.today
    approval.save
  end

  # Just for Guild Memberships, until we rewrite them.
  def provisional_approve(current_user)
    self.approvable.provisional = true if self.approvable.respond_to?(:provisional)
    approval.approve(current_user)
  end

  def reject(current_user, rejection_reason)
    approval.approved = false
    approval.approved_by = current_user
    approval.approved_on = Date.today
    approval.rejection_reason = rejection_reason
    approval.save
    self.approvable.overall_reject
  end

end
