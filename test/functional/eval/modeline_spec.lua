local helpers = require('test.functional.helpers')(after_each)
local clear, execute, write_file = helpers.clear, helpers.execute, helpers.write_file
local eq, eval = helpers.eq, helpers.eval

describe("modeline", function()
  local tempfile = helpers.tmpname()
  before_each(clear)

  after_each(function()
    os.remove(tempfile)
  end)

  it('does not crash with a large version number', function()
    write_file(tempfile, 'vim100000000000000000000000')
    execute('e! ' .. tempfile)

    eq(2, eval('1+1'))  -- Still alive?
  end)
end)
