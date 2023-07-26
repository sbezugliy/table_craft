# frozen_string_literal: true

module TableCraft
  class TR < WrapperTag
    def initialize(*args)
      @tag = "tr"
      super(*args)
    end
  end
end
