require_relative 'state'

class AssignedState < State
	def initialize(case)
		@case = case
	end

	def edit
		# edit case
	end

	def diagnose(diagnosis)
		# diagnose

		# transition to the 'diagnosed' state
		@case.state = DiagnosedState.new(@case)
	end
end