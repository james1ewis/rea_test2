require 'rspec'

describe ReaTest::UserInterface::CommandExecutor do

  describe '#execute' do

    it 'passes report to the simulator' do
      parser = double('Parser')
      simulator = double('Simulator')

      expect(parser).to receive(:parse).with('REPORT') { ReaTest::UserInterface::Command.new type: :report }
      expect(simulator).to receive(:report)

      command_executor = ReaTest::UserInterface::CommandExecutor.new parser: parser,
                                                                     simulator: simulator

      command_executor.execute('REPORT')
    end

    it 'passes place to the simulator' do
      parser = double('Parser')
      simulator = double('Simulator')

      expect(parser).to receive(:parse).with('PLACE 1,2,NORTH') { ReaTest::UserInterface::Command.new type: :place,
                                                                                                      parameters: { position: ReaTest::Domain::Position.new(1, 2, :north) }}
      expect(simulator).to receive(:place)

      command_executor = ReaTest::UserInterface::CommandExecutor.new parser: parser,
                                                                     simulator: simulator

      command_executor.execute('PLACE 1,2,NORTH')
    end

    it 'passes move to the simulator' do
      parser = double('Parser')
      simulator = double('Simulator')

      expect(parser).to receive(:parse).with('MOVE') { ReaTest::UserInterface::Command.new type: :move }
      expect(simulator).to receive(:move)

      command_executor = ReaTest::UserInterface::CommandExecutor.new parser: parser,
                                                                     simulator: simulator

      command_executor.execute('MOVE')
    end

    it 'passes left to the simulator' do
      parser = double('Parser')
      simulator = double('Simulator')

      expect(parser).to receive(:parse).with('LEFT') { ReaTest::UserInterface::Command.new type: :left }
      expect(simulator).to receive(:left)

      command_executor = ReaTest::UserInterface::CommandExecutor.new parser: parser,
                                                                     simulator: simulator

      command_executor.execute('LEFT')
    end

    it 'passes right to the simulator' do
      parser = double('Parser')
      simulator = double('Simulator')

      expect(parser).to receive(:parse).with('RIGHT') { ReaTest::UserInterface::Command.new type: :right }
      expect(simulator).to receive(:right)

      command_executor = ReaTest::UserInterface::CommandExecutor.new parser: parser,
                                                                     simulator: simulator

      command_executor.execute('RIGHT')
    end

  end

end