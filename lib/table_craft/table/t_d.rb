# frozen_string_literal: true

module TableCraft
  class TD < WrapperTag
    def initialize(*args)
      @tag = "td"
      super(*args)
    end
  end
end
