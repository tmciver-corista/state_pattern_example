require 'test/unit'
require_relative '../lib/pathology_case'
require_relative '../lib/pending_state'

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
end