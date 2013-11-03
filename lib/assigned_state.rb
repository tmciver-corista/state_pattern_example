require_relative 'state'
require_relative 'diagnosed_state'

class AssignedState < State
	def initialize(aCase)
		@aCase = aCase
	end

	def edit
		# edit case
	end

	def diagnose(diagnosis)
		# diagnose

		# transition to the 'diagnosed' state
		@aCase.state = DiagnosedState.new(@aCase)
	end
end