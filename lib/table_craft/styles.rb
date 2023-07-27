# frozen_string_literal: true

module TableCraft
  class Styles
    include W3CValidators

    attr_accessor :selector, :properties
    attr_reader :validation, :css

    def initialize(styles)
      @styles = styles
      @validator = CSSValidator.new
      validate
      @styles
    end

    private

    def validate
      @validation = @validator.validate_text(@styles)
      validation_error unless @validation.errors.empty?
    end

    def validation_error
      raise %(
CSS is invalid. Errors:
#{format_errors}
)
    end

    def format_errors
      @validation.errors.map(&:to_s).join("\n")
    end
  end
end
