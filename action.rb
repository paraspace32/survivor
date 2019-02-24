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
      @count.times do |id|
        @circle.group << Person.new(id)
      end
    end

    def find_alive_person
      group = @circle.group
      current_person = group.first

      return 'Please add people to circle' if group.length.zero?

      if group.length == 1
        return "Alive Person: #{group.first.id}"
      else
        @count.times do
          next_person = @circle.next_left(group)
          kill_next_left_person(group, next_person)
          previous_person = current_person
          current_person = @circle.next_left(group)

          if current_person.id == previous_person.id
            return "Alive Person: #{current_person.id}"
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
  object = Simulate::Action.new(10) # Add number of people here
  object.add_person_to_circle
  puts object.find_alive_person
rescue StandardError
  raise StandardError, 'Server is temporary down. Please try later'
end
