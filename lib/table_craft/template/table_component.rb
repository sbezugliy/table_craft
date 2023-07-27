module TableCraft
  module Template
    class TableComponent < ::Phlex::HTML
    	def initialize(headers=[], data=[], table_attrs={})
        @headers = headers
        @data = data
        @table_attrs = table_attrs
        # @size_limits = size_limits
        super()
      end
    
      def template
    		table(class: "table", **@table_attrs) do
          render HeadComponent.new(@headers)
          render BodyComponent.new(@data)
        end
    	end
    end
  end
end
