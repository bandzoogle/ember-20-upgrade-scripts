#!/usr/bin/env ruby

file_name = ARGV[0]

contents = File.read file_name

def replace_controllers(controllers)
  result = ''
  tab = '  '
  controllers.each do |controller|
    result << "#{tab}#{controller}: Ember.inject.controller()\n"
  end

  result
end

controllers = []

contents = contents.gsub(/[ \t]*needs: \[([^\]]+)\]/) do |match|
  controllers.push *Regexp.last_match[1].gsub(/["']/, '').split(',').collect(&:strip)
  replace_controllers(controllers)
end

contents = contents.gsub(/[ \t]*needs: \'([^\']+\')/) do |match|
  controllers.push Regexp.last_match[1].gsub(/["']/, '').strip
  replace_controllers(controllers)
end

controllers.each do |controller|
  contents = contents.gsub(/'[^']+'/) do |match|
    match.gsub("controllers.#{controller}", controller)
  end
end

print contents
