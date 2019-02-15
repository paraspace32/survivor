require_relative 'person'
require_relative 'circle'

module Simulate
  class Action
    attr_accessor :circle, :count

    def initialize(count)
      @count = count
      @circle = Circle.new
    end

    def add_person_to_circle
      if @count == 0
        puts 'Please add more people'
        return
      end

      @count.times do |id|
        @circle.group << Person.new(id)
      end
    end

    def find_alive_person
      group = @circle.group
      current_person = group.first

      return if group.length == 0

      if group.length == 1
        puts "Alive Person #{group.first.id}"
      else
        @count.times do
          next_person = @circle.next_left(group)
          kill_next_left_person(group, next_person)
          previous_person = current_person
          current_person = @circle.next_left(group)

          if current_person.id == previous_person.id
            puts "Alive Person #{current_person.id}"
            break
          end
        end
      end
    end

    private

    def kill_next_left_person(group, person)
      group.delete(person)
    end
  end
end

begin
  object = Simulate::Action.new(n = 10) # Add number of people here
  object.add_person_to_circle
  object.find_alive_person
rescue StandardError => e
  raise StandardError, 'Server is temporary down. Please try later'
end