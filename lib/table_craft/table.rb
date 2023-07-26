# frozen_string_literal: true

module TableCraft
  class Table < WrapperTag
    def initialize(*args)
      @tag = "table"
      super(*args)
    end
  end
end
