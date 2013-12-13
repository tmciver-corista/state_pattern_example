require 'test/unit'
require_relative '../lib/pathology_case'
require_relative '../lib/pending_state'
require_relative '../lib/diagnosed_state'
require_relative '../lib/closed_state'
require_relative '../lib/illegal_state_transition_exception'

class TestCase < Test::Unit::TestCase
	def setup
		# create a new case
		@aCase = Case.new('John Doe')
	end

	def testNewCaseState
		# verify that the case is in the 'pending' state
		assert(@aCase.state.instance_of?(PendingState))
	end

	def testAssignCase
		# assign the case
		@aCase.assign("Dr. Fine")

		# verify that the case is in the 'assigned' state
		assert(@aCase.state.instance_of?(AssignedState))
	end

	def testDiagnoseCase
		# assign the case
		@aCase.assign("Dr. Howard")

		# provide a diagnosis
		@aCase.diagnose("Patient has a bad cold.")

		# verify that the case is in the 'complete' state
		assert(@aCase.state.instance_of?(DiagnosedState))
	end

	def testReopenFromDiagnosed
		# assign the case
		@aCase.assign("Dr. Fine")

		# provide a diagnosis
		@aCase.diagnose("Patient has a bad cold.")

		# reopen
		@aCase.reopen

		assert(@aCase.state.instance_of?(AssignedState))
	end

	def testCloseCase
		# assign the case
		@aCase.assign("Dr. Howard")

		# provide a diagnosis
		@aCase.diagnose("Patient has a bad cold.")

		# close the case
		@aCase.close

		# verify that the case is in the 'complete' state
		assert(@aCase.state.instance_of?(ClosedState))
	end

	def testReopenFromClosed
		# assign the case
		@aCase.assign("Dr. Fine")

		# provide a diagnosis
		@aCase.diagnose("Patient has a bad cold.")

		# close the case
		@aCase.close

		# reopen
		@aCase.reopen

		# verify that the case is in the 'complete' state
		assert(@aCase.state.instance_of?(AssignedState))
	end

	def testPendingToDiagnosedException
		# try to diagnose the case from the 'pending' state
		assert_raises(IllegalStateTransitionException) { @aCase.diagnose("Patient has a bad cold.") }
	end

	def testPendingToClosedException
		# try to close the case from the 'pending' state
		assert_raises(IllegalStateTransitionException) { @aCase.close }
	end

	def testClosedToDiagnosedException
		# assign the case
		@aCase.assign("Dr. Howard")

		# provide a diagnosis
		@aCase.diagnose("Patient has a bad cold.")

		# close the case
		@aCase.close
		
		# try to diagnose the case from the 'closed' state
		assert_raises(IllegalStateTransitionException) { @aCase.diagnose("Patient has a bad cold.") }
	end
end