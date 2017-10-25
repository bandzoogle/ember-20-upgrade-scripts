#!/usr/bin/env ruby

file_name = ARGV[0]

contents = File.read file_name

IDENTIFIER = /[a-zA-Z\-\.]+/

contents = contents.gsub(/\{\{#each (#{IDENTIFIER}) in (#{IDENTIFIER})/) do |match|
  _, item, collection = Regexp.last_match
  item = Regexp.last_match[1]
  collection = Regexp.last_match[2]

  "{{#each #{collection} as |#{item}|"
end

print contents

exit 1

