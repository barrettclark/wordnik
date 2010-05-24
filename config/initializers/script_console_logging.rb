# make AR output go to STDOUT in script/console
if "irb" == $0
  # ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveResource::Base.logger = Logger.new(STDOUT)
end
# ActiveResource::Base.logger = ActiveRecord::Base.logger
ActiveResource::Base.logger = Logger.new(STDOUT)