require 'observer'

module ReaTest
  module UserInterface
    module Commands

      class Command
        include Observable
      end

    end
  end
end