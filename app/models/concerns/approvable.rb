module Approvable
extend ActiveModel::Concern

included do
	has_many: :approvals, as: :approvable
end

  module ClassMethods

    

  end

end
