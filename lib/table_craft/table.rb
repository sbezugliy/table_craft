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
      run_output(*args)
    end
    
    private

    def run_output(*args)
      return ::TableCraft::Output::Shell.new(@document) if args[0] == "print"
      return ::TableCraft::Output::HtmlFile.new(@document).output(args[1]) if args[0] == "file"
      raise NotImplementedError, "Output processor for type #{args[0]} not implemented"
    end

    def build_document
      @document = ::TableCraft::Template::Document.new().call {|t| template_params[t] }
    end
    
    def test_data
      [
        [ "1", "Name 1", "Value 1" ],
        [ "2", "Name 2", "Value 2" ],
        [ "4", "Name 3", "Value 3" ]
      ]
    end
    
    def collect_table_attrs
      TABLE_ATTRIBUTES.each{|attr| add_table_attr(attr)}
    end
    
    def add_table_attr(attr)
      value = public_send(attr)
      @table_attrs[attr] = value if value
    end
      
    def table_size
      { cols: @cols, rows: @rows }
    end
    
    def table_component
      ::TableCraft::Templates::TableComponent.new(
        @headers, 
        ::TableCraft::DataSource::Adapter(*source), 
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
      public_send("#{method}=", *args)
    end
  end
end