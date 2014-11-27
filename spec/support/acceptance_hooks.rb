module AcceptanceHooks
  Before do
    $stdout = StringIO.new
    $stdin = StringIO.new
  end

  After do

  end
end