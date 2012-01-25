module SNMPCheck

  class Thresholds
    
    def self.status(result, warning, critical)
      
      case result.result
        when :sucessful then
          return 0 if result.data <= warning
          return 1 if result.data >  warning && result.data <= critical
          return 2 if result.data >  critical

        when :undefined, :error then 
          return 3
      else
        return 3
      end
    end
  end
end