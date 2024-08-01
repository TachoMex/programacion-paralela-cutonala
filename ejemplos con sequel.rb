require 'sequel'
db = Sequel.sqlite('.class.db')
db.create_table(:users) do
  String :name, unique: true
  Integer :age, null: false
end

def insert_user(db, name, age)
  db[:users].insert(name: name, age: age)
end

insert_user(db, 'Harry Potter', 19)
db[:users].insert(name: 'Hermione Granger', age: 23)
db[:users].insert(name: 'Ronnald Wesley', age: 21)
db[:users].all
require 'sequel'
b = Sequel.sqlite('.class.db')
db[:users].all
result = _
result[0]
result[0][:name]
db[:users].where { name < 20 }
db[:users].where { name < 20 }.all
db[:users].where { age < 20 }.all
db[:users].where { age < 20 }.update(age: 21)
db[:users].where { age < 20 }.all
profe = { name: 'Albus Dumbledore', age: 24}
db[:users].insert(profe)
db[:users].all
db[:users].count
db[:users].goup_by(:age).count
db[:users].group_by(:age).count
db[:users].group_by(:age).all
db[:users].group_by(:age).sql
require 'bcrypt'
pass = 'abretesesamo'
hash = BCrypt::Password.create(pass)
hash == pass
hash.class
hash == 'hola'
