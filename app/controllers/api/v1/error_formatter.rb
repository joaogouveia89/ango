module API
  module V1
    module ErrorFormatter
    	def self.call(e, backtrace, options, env, b)
	      case e
	      when ActiveRecord::RecordInvalid
	        status = 'fail'
	        errors = e.record.errors.messages
	      else
	        status = 'error'
	        errors = e
	      end

	      {
	        status: status,
	        errors: errors
	      }.to_json
	    end
    end
  end
end