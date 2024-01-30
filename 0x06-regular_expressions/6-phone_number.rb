#!/usr/bin/env ruby

# Check if the argument matches the regular expression for a 10-digit phone number
puts ARGV[0].match(/^\d{1,10}$/).join
