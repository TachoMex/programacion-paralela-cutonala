# Control de usuarios
# - Registrar usuario
# - Acceder con contraseña correcta
# - Negar el acceso si el usuario no existe
# - Negar el acceso si la contraseña es incorrecta
# - Evitar que se pueda registrar el usuario si ya existe
# - Cambio de contraseña
#
#
# Salas de chat
# - Crear un chat 1 a 1
# - Crear un chat grupal
# - Consultar la lista de chats
# - Añadir un usuario a un chat
# - Eliminar un usuario de un chat
# - Enviar un mensaje a un chat
# - Consultar los mensajes de un chat, paginados de 100 en 100
# - Enviar un mensaje a un chat no existente
# - Enviar un mensaje a un chat no registrado
# - Consultar un chat no registrado
# - Crear un chat ya existente
#
# Archivos
# - Crear foto de perfil
# - Bajar foto de perfil
# - Adjuntar archivo por mensaje
# - bajar archivo adjunto

require 'ant/client'
class ChatTest < Ant::Client::Base
  def register(user, pass)
    post('/api/users/', user: user, pass: pass)
  end

  def login(user, pass)
    post('/api/auth', user: user, pass: pass)
  end

  def change_password(user, old, new)
    patch("/api/users/#{user}", old: old, new: new)
  end

  def create_chat(token, name)
    post("/api/chats/#{name}", token: token)
  end

  def register_chat(token, room, user)
    post("/api/chats/#{room}/users", token: token, user: user)
  end

  def publish(token, room, message)
    post("/api/chats/#{room}/message", token: token, message: message)
  end

  def get_messages(token, room)
    post("/api/chats/#{room}/message/read", token: token)
  end

  def my_chats(token)
    get('/api/chats', token: token)
  end
end

chat = ChatTest.new(format: :json, endpoint: 'http://localhost:9293')

ap chat.register('alice', 'alice1234')
alice = chat.login('alice', 'alice1234')
ap(alice)
ap chat.login('alice2', 'alice1234')
ap chat.login('alice', 'alice12345')
ap chat.register('alice', 'alice1234')
# ap chat.change_password('alice', 'alice1234', 'alice12345')
# ap chat.login('alice', 'alice12345')
# ap chat.login('alice', 'alice1234')

ap chat.register('bob', 'bob1234')
bob = chat.login('bob', 'bob1234')
ap(bob)
# #
ap(chat.create_chat(alice[:data][:token], 'securechat'))
ap(chat.register_chat(alice[:data][:token], 'securechat', 'bob'))

thread = [
  { from: alice, message: 'hi bob' },
  { from: bob, message: 'hi alice' },
  { from: alice, message: 'how are you?' },
  { from: bob, message: 'Im fine, and you?' },
  { from: alice, message: 'whant to have some burguers?' },
  { from: bob, message: 'sure, lets go' }
]

thread.each do |message|
  ap chat.publish(message[:from][:data][:token], 'securechat', message[:message])
end

ap(chat.my_chats( alice[:data][:token]))

puts " =================== ALICE CHAT ============================"

loop do
  message = chat.get_messages(alice[:data][:token], 'securechat')
  ap(message)
  break if message[:status] != 'success'
end

puts " =================== ALICE CHAT ============================"
