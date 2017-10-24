#!/usr/bin/env ruby

IDENTIFIER = /[a-zA-Z\-\.]+/

file_name = ARGV[0]

contents = File.read file_name

contents = contents.gsub(/\{\{bind\-attr class=\"([^\"]+)\"\}\}/) do |match|
  class_content = Regexp.last_match[1]
  class_content = class_content.split(' ').collect do |segment|
    case segment
      when /(#{IDENTIFIER}):(#{IDENTIFIER}):(#{IDENTIFIER})/
        "{{if #{$1} '#{$2}' '#{$3}'}}"
      when /(#{IDENTIFIER}):(#{IDENTIFIER})/
        "{{if #{$1} '#{$2}'}}"
      when /:(#{IDENTIFIER})/
        "#{$1}"
      else
        "{{#{segment}}}"
    end
  end.join(' ')

  %{class="#{class_content}"}
end

print contents

exit 1
