# frozen_string_literal: true

module TableCraft
  class Styles
    include W3CValidators

    attr_accessor :styles
    attr_reader :validation, :css

    def initialize(path)
      @styles = read(path)
      @validator = CSSValidator.new
      validate
      @styles
    end

    private

    def read(path)
      File.read(path)
    end

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
