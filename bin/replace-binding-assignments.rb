#!/usr/bin/env ruby

IDENTIFIER = /[a-zA-Z\-\.]+/

file_name = ARGV[0]

contents = File.read file_name


contents = contents.gsub(/(#{IDENTIFIER})Binding\s*=\"([^\"]+)\"/) do |match|
  name = Regexp.last_match[1]
  value = Regexp.last_match[2]
  "#{name}=#{value}"
end


print contents

exit 1
