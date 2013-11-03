require_relative 'state'

class PendingState < State
	def initialize(aCase)
		@case = aCase
	end

	def assign(assignee)
		# assignment code

		# transition to the 'assigned' state
		@case.state = AssignedState.new(@case)
	end
end