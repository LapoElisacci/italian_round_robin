# frozen_string_literal: true

require_relative "italian_round_robin/version"

module ItalianRoundRobin
  class Error < StandardError; end
  
  class << self
    def generate(members)
      @@members = members
      # When size number is odd we generate a BYE pairing
      @@size = members.size.odd? ? members.size + 1 : members.size
      @@half = (@@size / 2).to_i
      # List of members indexes i.e. [1, 2, 3, ..., n]
      indexes = [*1..@@size]
      # List of Matches per Round
      rounds = []
      # Generate the 1st Round
      rounds << generate_round(1, indexes)
      # Generate the remaining rounds
      (2...@@size).each do |gyros|
        # Remove and save the constant player index
        constant_index = indexes.delete_at(@@size-1)
        # Move in the first half of the list to the end of it
        indexes.concat(indexes[0...@@half])
        # Save the second half to the first one
        indexes[0...@@half - 1] = indexes[@@half...@@size-1]
        # Remove double entries
        indexes.slice!(@@half-1...@@size-1)
        # Add the constant player index
        indexes.append(constant_index)
        # Generate the round
        rounds << generate_round(gyros, indexes)
      end
      rounds
    end

    private

      def generate_round(round, indexes)
        matches = []
        start_index = 0

        # In even round the highest index player gets White 
        if round.even?
          white = @@members[indexes[@@size - 1] - 1]
          black = @@members[indexes[0] - 1]
          matches << [white, black]
          start_index = 1
        end

        (start_index...@@half).each do |i|
          white = @@members[indexes[i] - 1]
          black = @@members[indexes[@@size - 1 - i] - 1]
          matches << [white, black]
        end

        matches
      end
  end
end

