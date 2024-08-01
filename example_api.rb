require 'grape'
require 'puma'
require 'ant'
require 'ant/server/grape'

class ExampleAPI < Grape::API
  include Ant::Server::GrapeDecorator

  STUDENTS = [{ name: 'Max', age: 23 },
   { name: 'Edwin', age: 19 },
   { name: 'Arturo', age: 21 }]
  version('v1', using: :header, vendor: :cut)
  prefix(:api)
  format(:json)

  get do
    fail('Something went wrong, passwords are 1234')
  end

  namespace :alumnos do
    # /api/alumnos
    get do
      puts params['hello']
      puts params[:hello]
      puts env['HTTP_HELLO']
      STUDENTS
    end

    post do
      puts '=' * 80
      puts request.body.read
      puts '=' * 80
      { status: :success }
    end

    route_param :student_code do
      get do
        puts params[:student_code]
        STUDENTS.find { |student| student[:name] == params[:student_code] }
      end

      post do
        name = params[:student_code]
        age = params[:age]
        new_student = { name: name, age: age }
        STUDENTS << new_student
        new_student
      end

      delete do
        puts 'ignored'
        { status: :ignored }
      end
    end
  end
end
