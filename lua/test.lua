
local t = {}

t.it = function(message, case)
  print(message)
  case(t)
end

t.it('prova', function(t)

  assert(false == false, 'asdasd')
end)
