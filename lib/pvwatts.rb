require "httparty"

Dir[File.dirname(__FILE__) + '/pvwatts/*.rb'].each do |file|
  require file
end