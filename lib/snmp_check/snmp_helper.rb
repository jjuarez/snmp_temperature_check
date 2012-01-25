require 'rubygems'
require 'snmp'
require 'ostruct'


module SNMPCheck

  class SNMPHelper
  
    def self.get(options = { })

      output = OpenStruct.new(:result=>:undefined, :data=>nil, :error=>nil)
    
      raise ArgumentError.new("Invalid arguments list: #{options.inspect}") unless(options[:host] || options[:oid])
      
      SNMP::Manager.open(:Host=>options[:host], :Version=>:SNMPv1) do |s| 
        
        output.data = s.get_value(options[:oid]).split(' ')[0].to_f 
      end
    rescue Exception => e
    
      output.result = :error
      output.error  = e
    else
    
      output.result = :sucessful
    ensure
    
      return output
    end
  end
end