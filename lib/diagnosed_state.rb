require_relative 'state'

class DiagnosedState < State
	def initialize(case)
		@case = case
	end

	def close
		# close the case

		# transition to the 'closed' state
		@case.state = ClosedState.new(@case)
	end
end
