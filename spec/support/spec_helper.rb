require_relative '../../lib/rea_test/application'
require_relative '../../lib/rea_test/user_interface/main_menu'
require_relative '../../lib/rea_test/user_interface/parser'
require_relative '../../lib/rea_test/user_interface/commands/command_factory'
require_relative '../../lib/rea_test/user_interface/commands/place_command'
require_relative '../../lib/rea_test/user_interface/commands/report_command'
require_relative '../../lib/rea_test/user_interface/commands/move_command'
require_relative '../../lib/rea_test/user_interface/commands/left_command'
require_relative '../../lib/rea_test/user_interface/commands/right_command'
require_relative '../../lib/rea_test/domain/position'
require_relative '../../lib/rea_test/domain/Robot'
require_relative '../../lib/rea_test/domain/simulator'
require_relative '../../lib/rea_test/domain/table'
require_relative '../../lib/rea_test/domain/mover'
require_relative '../../lib/rea_test/domain/rotater'
require_relative 'parser_helper'
require_relative 'command_helper'

require 'rspec'

RSpec.configure do |config|
  config.include ParserHelper
  config.include CommandHelper
end
