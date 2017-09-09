require_relative 'practica'

def test_model(tested_class, data)
  t = tested_class.new(*data)
  t.register

  begin
    # should fail as the object was already registered
    t.register
  rescue => ex
    puts "Unexpected Error: #{ex.message}"
  end

  # returns all the objects from database
  ap(tested_class.list_all)
  t.id
end

u_id = test_model(User, ['test', 'juan perez', 'juanito@udg.mx'])
s_id = test_model(Site, ['cutonala', 'Centro Universitario de Tonala', 'cutonala.udg.mx'])
test_model(Authentication, [u_id, s_id, 'Th1s154StrongP4$$\/\/0rd'])
