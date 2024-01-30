#!/usr/bin/env ruby

# Define a method to parse the log entry and extract relevant information
def parse_log_entry(log_entry)
  match_data = log_entry.match(/\[from:([^]]+)\] \[to:([^]]+)\] \[flags:([^]]+)\]/)
  sender = match_data[1]
  receiver = match_data[2]
  flags = match_data[3]

  "#{sender},#{receiver},#{flags}"
end

# Read the log file and process each log entry
log_file_path = ARGV[0]
if log_file_path.nil?
  puts "Usage: ./100-textme.rb <log_file>"
  exit 1
end

# Process each line in the log file
File.readlines(log_file_path).each do |line|
  # Check if the line contains the relevant information
  if line.include?('Receive SMS') || line.include?('Sent SMS')
    result = parse_log_entry(line)
    puts result
  end
end
