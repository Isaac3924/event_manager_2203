# ./lib/event_manager.rb
require "csv"
puts "EventManager initialized."

# contents = CSV.open "./data/event_attendees.csv", headers: true
# contents.each do |row|
#     name = row[2]
#     puts name
# end

def clean_zipcode(zipcode)
    # if the zip code is exactly 5 digits, assume that it is ok
    # if the zip code is more than 5 digits, truncate it to the first 5 digits
    # if the zip code is less than 5 digits, add zeroes to the front until it becomes 5 digits
    # if zipcode.nil?
    #     zipcode = "00000"
    # elsif zipcode.length < 5
    #     zipcode = zipcode.rjust 5, "0"
    # elsif zipcode.length > 5
    #     zipcode = zipcode[0..4]
    # else
    #     zipcode
    # end

    zipcode.to_s.rjust(5, "0"[0..4])
end
contents = CSV.open "./data/event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
    name = row[:first_name]

    zipcode = clean_zipcode(row[:zipcode])

    puts "#{name} #{zipcode}"
end