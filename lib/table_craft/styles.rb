module TableCraft
  class Styles
    include W3CValidators
    
    attr_accessor :selector, :properties 
    attr_reader :validation, :css
    
    def initialize(selector = nil, properties = {})
      @selector = selector
      @properties = properties
      @validator = CSSValidator.new
      check_args
      build
      validate
    end
    
    private
    
    def build
      @css = %Q(#{@selector} {
#{map_properties}
})
    end
  
    def map_properties
      @properties.map do |property|
        "    #{property[0].to_s}: #{property[1].to_s};"      
      end.join("\n")
    end
    
    def validate
      @validation = @validator.validate_text(@css)
      validation_error unless @validation.errors.empty?
    end
    
    def validation_error
      raise RuntimeError, %Q(
CSS is invalid. Errors:
#{format_errors}
)
    end
    
    def format_errors
      @validation.errors.map{|error| "#{error.to_s}"}.join("\n")
    end
    
    def check_args
      raise ArgumentError,
            "Stylesheet selector should be given." if @selector.empty?
      raise ArgumentError,
            "Stylesheet properties should not be empty." if @properties.empty?
    end
  end
end