require 'resque'

module HelloRuby
  @queue = :hello_ruby

  def self.perform
    puts "hello from ruby"
  end
end
