#!/usr/bin/env ruby

require 'rails'
require 'active_record'
require 'optparse'
require 'optparse/time'
require 'date'
require 'time'

OptionParser.new do |parser|
  
  parser.banner = "Options:"

  parser.on("-a", "--start_date [DATETIME]", Time, "# Date to start search at, ISO8601 or YYYY-MM-DD format") do |datetime|
    @start_date = DateTime.parse(datetime.to_s)
  end
  
  parser.on("-b", "--end_date [DATETIME]", Time, "# ISO8601 Date to end search at, ISO8601 or YYYY-MM-DD format") do |datetime|
    @end_date = DateTime.parse(datetime.to_s)
    
  end
  
end.parse!

puts "Start date #{@start_date}"
puts "End date #{@end_date}"

p = ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'db/applicants.sqlite3',
)

c = p.connection

results = c.execute("SELECT COUNT(workflow_state) AS count,
                            DATE(applicants.created_at, 'weekday 0', '-6 days') AS week,
                            workflow_state
                            FROM applicants
                            GROUP BY week, workflow_state
                            ORDER BY week, workflow_state 
                            LIMIT 200;")

results.each do |result|
  p result
end