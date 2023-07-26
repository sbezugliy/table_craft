# frozen_string_literal: true

module TableCraft
  class TH < WrapperTag
    def initialize(*args)
      @tag = "th"
      super(*args)
    end
  end
end
