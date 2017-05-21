module Abstractivator
  module Cons
    Nil = Object.new
    Nil.define_singleton_method(:empty?) { true }

    def empty_list
      Nil
    end

    def cons(h, t)
      Cell.new(h, t)
    end

    def head(p)
      p.first
    end

    def tail(p)
      p.last
    end

    def list_to_enum(list)
      Enumerator.new do |y|
        while list != Nil
          y << head(list)
          list = tail(list)
        end
      end
    end

    def enum_to_list(enum)
      e = enum.reverse.each
      result = Nil
      begin
        while true
          result = cons(e.next, result)
        end
      rescue StopIteration
        result
      end
    end

    class Cell < Array
      def initialize(h, t)
        super([h, t])
      end

      def head
        first
      end

      def tail
        last
      end
    end

    extend self
  end
end
