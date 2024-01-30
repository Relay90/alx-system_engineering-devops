#!/usr/bin/env ruby

def parse_log_entry(log_entry)
  sender = log_entry.match(/\[from:([^]]+)\]/)[1]
  receiver = log_entry.match(/\[to:([^]]+)\]/)[1]
  flags = log_entry.match(/\[flags:([^]]+)\]/)[1]

  "#{sender},#{receiver},#{flags}"
end

log_file_path = ARGV[0]
if log_file_path.nil?
  puts "Usage: ./100-textme.rb <log_file>"
  exit 1
end

File.readlines(log_file_path).each do |line|
  if line.include?('Receive SMS') || line.include?('Sent SMS')
    result = parse_log_entry(line)
    puts result
  end
end
