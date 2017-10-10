module Approvable
extend ActiveSupport::Concern

  included do

  end

  module ClassMethods

    def overall_approve
				self.overall_decision_status = true
				self.decision_date = Date.today
        self.save
		end

		def overall_reject
				self.overall_decision_status = false
				self.decision_date = Date.today
        self.save
		end

  end

end
