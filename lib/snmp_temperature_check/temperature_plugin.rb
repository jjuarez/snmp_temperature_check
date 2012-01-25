module SNMPCheck

  class TemperaturePlugin
    
    MANAGEMENT_MODULE_TEMPERATURE = "1.3.6.1.4.1.2.3.51.2.2.1.1.2.0"
    FRONT_PANEL_TEMPERATURE       = "1.3.6.1.4.1.2.3.51.2.2.1.5.1.0"
    
    def self.check_temperature(options = {})
  
      case options[:type].to_sym
        when :fpt then return SNMPCheck::SNMPHelper.get(:host=>options[:host], :oid=>FRONT_PANEL_TEMPERATURE)
        when :mmt then return SNMPCheck::SNMPHelper.get(:host=>options[:host], :oid=>MANAGEMENT_MODULE_TEMPERATURE)
      else
        return OpenStruct.new(:result=>:undefined, :data=>nil, :error=>"Invalid check: #{options[:type]}")
      end
    end
  end
end