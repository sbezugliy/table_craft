module TableCraft
  class Table
    
    TABLE_ATTRIBUTES = [:width, :height, :cellpadding, :border]
    
    attr_reader :document
    attr_writer *::TableCraft::ATTRIBUTES

    def initialize(*args)
      @table_attrs = {}
    end

    def output=(*args)
      collect_table_attrs
      build_document
      pp args
      run_output(*args)
    end
    
    private

    def run_output(*args)
      type = args[0][0]
      path = args[0][1] || nil
      pp type
      return ::TableCraft::Output::Adapter.new(type, @document, @formatted).data.output(path)
    end

    def build_document
      @document = ::TableCraft::Template::Document.new().call {|t| template_params[t] }
    end
    
    def collect_table_attrs
      TABLE_ATTRIBUTES.each{|attr| add_table_attr(attr)}
    end
    
    def add_table_attr(attr)
      value = public_send(attr)
      @table_attrs[attr] = value if value
    end
    
    def table_component
      ::TableCraft::Template::TableComponent.new(
        @header, 
        ::TableCraft::DataSource::Adapter.new(*@source).data,
        @table_attrs)
    end
    
    def template_params
      {
        title: @title,
        styles: @styles,
        body: table_component.call()
      }
    end

    def method_missing(method, *args)
      public_send("#{method}=", args)
    end
  end
end