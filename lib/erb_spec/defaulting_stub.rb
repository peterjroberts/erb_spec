module ErbSpec
  class DefaultingStub
    def initialize(name, print_unstubbed = false)
      @print_unstubbed = print_unstubbed
      @name = name
      @methods = {}
    end

    def method_missing(name, *args)
      puts "Called: #{@name}.#{name} with arguments '#{args}'" if @print_unstubbed
      @methods[name] ||= DefaultingStub.new(name, @print_unstubbed)
    end

    def to_str
      ''
    end

    def to_f
      0.0
    end

    def to_i
      0
    end

    def to_ary
      []
    end
  end
end
