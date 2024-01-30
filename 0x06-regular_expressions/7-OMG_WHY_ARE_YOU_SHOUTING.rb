#!/usr/bin/env ruby

# Check if the argument contains only capital letters
result ARGV[0].scan(/[A-Z]+/).join
