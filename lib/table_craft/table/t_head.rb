# frozen_string_literal: true

module TableCraft
  class THead < WrapperTag
    def initialize(*args)
      @tag = "thead"
      super(*args)
    end
  end
end
