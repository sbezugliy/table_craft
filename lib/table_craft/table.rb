# frozen_string_literal: true

module TableCraft
  class Table
    TABLE_ATTRIBUTES = [:width, :height, :cellpadding, :border]

    attr_reader :document
    attr_writer(*::TableCraft::ATTRIBUTES)

    def initialize(*args)
      @table_attrs = {}
    end

    def output=(*args)
      collect_table_attrs
      build_document
      run_output(*args)
    end

    private

    def run_output(*args)
      type = args[0][0]
      path = args[0][1] || nil
      ::TableCraft::Output::Adapter.new(type, @document, @formatted).data.output(path)
    end

    def build_document
      @document = ::TableCraft::Template::Document.new(
        ::TableCraft::Template::TableComponent.new(
          @header[0],
          ::TableCraft::DataSource::Adapter.new(*@source).data,
          @table_attrs,
        ),
      ).call do |t|
        template_params[t]
      end
    end

    def collect_table_attrs
      TABLE_ATTRIBUTES.each { |attr| add_table_attr(attr) }
    end

    def add_table_attr(attr)
      value = instance_variable_get(:"@#{attr}")[0]
      @table_attrs[attr] = value if value
    end

    def template_params
      {
        title: @title[0],
        styles: Styles.new(*@styles).styles,
      }
    end

    def method_missing(method, *args)
      public_send("#{method}=", args)
    end

    def respond_to_missing? *args
      return true if ::TableCraft::ATTRIBUTES.include?(args[0])

      false
    end
  end
end
