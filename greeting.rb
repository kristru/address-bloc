def greet_person
  greeting = ARGV[0]
  ARGV.each do |arg|
    next if arg == greeting
    puts  greeting + " #{arg}"
  end
end

greet_person
