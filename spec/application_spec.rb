require_relative 'support/spec_helper'

describe ReaTest::Application do

  let(:ui_presenter) { double('UIPresenter') }

  it 'instantiates the user interface' do
    expect(ui_presenter).to receive(:run).with($stdout, $stdin)
  end
end
