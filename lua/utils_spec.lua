
local test = {}

test.it = function(message, case)
  print(message)
  case(test)
end

test.assert = function (result, message)
  assert(result, message)
end

-- TODO Configurare test runner
test.it('prova', function(t)
  t.assert(false == true)
end)
