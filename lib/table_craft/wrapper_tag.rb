module TableCraft
  class WrapperTag
    
    attr_accessor :tag
    
    def initialize()
      raise "Define tag for #{self.classname}" unless @tag
    end
    
    def call(&block)
      puts "<#{@tag}>"
        block.call if block_given?
      puts "</#{@tag}>"
    end
  end
end