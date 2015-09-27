require 'yaml'

if ARGV[1] == nil
  puts "Please choose an output file name(.tsv)"
  output_file = gets.chomp
else
  output_file = ARGV[1]
end

tsv_temp = YAML::load(File.read(ARGV[0]))
# puts "#{tsv_temp}"

first_item = tsv_temp[0]
header_info = []
first_item.each_key { | key | header_info.push(key) }

# puts "#{header_info}"
content = ""
length = header_info.length
content << header_info.reduce { |n1,n2| "#{n1}\t#{n2}"} + '\n'

content_info = []
tsv_temp.each_index do |row|
  item_arr = tsv_temp[row]
  item_arr.each_value { |value| content_info.push(value)}
  content << content_info.reduce { |n1,n2| "#{n1}\t#{n2}"} + '\n'
end

# puts "#{content}"

File.open(output_file, 'w') do |line|
  line.puts content
end
