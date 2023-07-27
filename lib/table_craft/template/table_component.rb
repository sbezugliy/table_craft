module TableCraft
  module Template
    class TableComponent < ::Phlex::HTML
    	def initialize(headers=[], data=[], table_attrs={})
        @headers = headers
        @data = data
        @table_attrs = table_attrs
        super()
      end
    
      def template
    		table(class: "table", **@table_attrs) do
          render THeadComponent.new(@headers)
          render TBodyComponent.new(@data)
        end
    	end
    end
  end
end
