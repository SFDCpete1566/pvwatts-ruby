module PVWatts

  class System
  	attr_reader :system_size, :address, :derate, :tilt
  	attr_accessor :building_name

  	include HTTParty
 
    base_uri 'http://api/pvwatts/v4'

    def initialize(building_id, system_size, address, derate, tilt)
	    self.building_name = buidling_name
	  end

    def profile
	    self.class.get '/api/pvwatts/v4.json?api_key=E5VcxKj2Cv0sksDurt5wIXpSCAAgsYvm3WYgHBcj&system_size=4&dataset=tmy2&derate=0.77&lat=40&lon=-105'
	  end

	  def method_missing(name, *args, &block)
		  if profile.has_key?(name.to_s)
		    profile[name.to_s]
		  else
		    super
		  end
		end
  end

end