module Hashids_module
	extend ActiveSupport::Concern
	hashids = Hashids.new("some_salt", 8)
end
