# frozen_string_literal: true

module TableCraft
  class TBody < WrapperTag
    def initialize(*args)
      @tag = "tbody"
      super(*args)
    end
  end
end
