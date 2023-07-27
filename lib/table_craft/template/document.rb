module TableCraft
  module Template
    class Document < ::Phlex::HTML
    	def template
    		doctype
		
    		html do
    			head do
    				title { yield(:title) }
            style { yield(:styles) } 
    			end
			
    			body do
    				yield(:body)
    			end
    		end
    	end
    end
  end
end