require_relative '../../../support/spec_helper'

describe ReaTest::UserInterface::Commands::NullCommand do

  describe '#execute' do

    it 'does nothing' do
      command = ReaTest::UserInterface::Commands::NullCommand.new
      command.execute
    end

  end

end
