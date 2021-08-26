module Sendcloud
  class Collection
    attr_reader :data, :next_cursor, :prev_cursor

    def self.from_response(response, key:, type:)
      body = response.body
      if key
        new(
          data: body[key].map { |attrs| type.new(attrs) },
          next_cursor: body.dig("next"),
          prev_cursor: body.dig("previous")
        )
      else
        new(
          data: body.map { |attrs| type.new(attrs) }
        )
      end
    end

    def initialize(data:, next_cursor: nil, prev_cursor: nil)
      @data = data
      @next_cursor = next_cursor
      @prev_cursor = prev_cursor
    end
  end
end
