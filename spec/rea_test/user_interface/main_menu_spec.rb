require_relative '../../support/spec_helper'

describe ReaTest::UserInterface::MainMenu do

  describe '#run' do

    before :each do
      @stdout = double('$stdout')
      @stdin = double('$stdin')
      @parser = double('parser')
    end

    it 'displays options to the user' do
      expect(@stdout).to receive(:puts).with('Enter EXIT to exit at anytime')
      expect(@stdout).to receive(:puts).with('Enter START to start the simulator')
      allow(@stdin).to receive(:gets) { "EXIT\n" }

      main_menu = ReaTest::UserInterface::MainMenu.new stdout: @stdout,
                                                      stdin: @stdin,
                                                      parser: @parser

      main_menu.run
    end

    it 'reads exit command from the user' do
      allow(@stdout).to receive(:puts)
      expect(@stdin).to receive(:gets) { "EXIT\n" }

      main_menu = ReaTest::UserInterface::MainMenu.new stdout: @stdout,
                                                       stdin: @stdin,
                                                       parser: @parser

      main_menu.run
    end

    it 'starts the command loop' do
      allow(@stdout).to receive(:puts).with('Enter EXIT to exit at anytime')
      allow(@stdout).to receive(:puts).with('Enter START to start the simulator')
      allow(@stdin).to receive(:gets).and_return("START\n", "EXIT\n")

      expect(@stdout).to receive(:puts).with('Enter Command:')

      main_menu = ReaTest::UserInterface::MainMenu.new stdout: @stdout,
                                                       stdin: @stdin,
                                                       parser: @parser

      main_menu.run
    end

    it 'executes commands' do
      move_command = double('MoveCommand')

      allow(@stdout).to receive(:puts).with('Enter EXIT to exit at anytime')
      allow(@stdout).to receive(:puts).with('Enter START to start the simulator')
      allow(@stdin).to receive(:gets).and_return("START\n", "MOVE\n", "EXIT\n")
      allow(@stdout).to receive(:puts).at_least(1).times.with('Enter Command:')
      allow(move_command).to receive(:add_observer)

      expect(@parser).to receive(:parse).with('MOVE') { move_command }
      expect(move_command).to receive(:execute)

      main_menu = ReaTest::UserInterface::MainMenu.new stdout: @stdout,
                                                       stdin: @stdin,
                                                       parser: @parser

      main_menu.run
    end

    it 'adds itself as an observer to each command' do
      move_command = double('MoveCommand')

      allow(@stdout).to receive(:puts).with('Enter EXIT to exit at anytime')
      allow(@stdout).to receive(:puts).with('Enter START to start the simulator')
      allow(@stdin).to receive(:gets).and_return("START\n", "MOVE\n", "EXIT\n")
      allow(@stdout).to receive(:puts).at_least(1).times.with('Enter Command:')

      expect(@parser).to receive(:parse).with('MOVE') { move_command }
      expect(move_command).to receive(:execute)

      main_menu = ReaTest::UserInterface::MainMenu.new stdout: @stdout,
                                                       stdin: @stdin,
                                                       parser: @parser

      expect(move_command).to receive(:add_observer).with(main_menu)

      main_menu.run
    end

  end

  describe '#update' do

    it 'updates the ui' do
      fake_stdout = double('$stdout')
      fake_stdin = double('$stdin')
      fake_output = 'test'

      expect(fake_stdout).to receive(:puts).with(fake_output)

      ui_presenter = ReaTest::UserInterface::MainMenu.new stdout: fake_stdout,
                                                          stdin: fake_stdin

      ui_presenter.update(fake_output)
    end

  end

end
