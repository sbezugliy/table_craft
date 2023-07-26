module TableCraft
  class WrapperTag < Object
    
    attr_accessor :tag, :raw, :css_class, :height, :width
    
    def initialize(width: nil, height: nil, css_class: nil)
      @width |= width
      @height |= height
      @css_class |= css_class
      raise "Define tag for #{self.classname}" unless @tag
    end
    
    def call()
      return "<#{ @tag } width=#{width} height=#{height}>#{ yield if block_given? }</#{ @tag }>"
    end
    
    def attributes()
      attributes = []
      attributes << width_attr
      attributes << height_attr
      attributes << css_class_attr
      attributes << width_attr
    end
    
    def css_class_attr
      return "class='#{@css_class}'" if @css_class
    end
    
    def width_attr
      return "width='#{@width}'" if @width
    end
    def height_attr
      return "height='#{@height}'" if @height
    end
  end
end
