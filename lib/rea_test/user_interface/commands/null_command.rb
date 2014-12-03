require_relative 'command'

module ReaTest
  module UserInterface
    module Commands

      class NullCommand < Command
        def initialize(**args)
          
        end

        def execute

        end
      end

    end
  end
end
