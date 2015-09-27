require 'yaml'

if ARGV[1] == nil
  puts "Please choose an output file name(.yml)"
  output_file = gets.chomp
else
  output_file = ARGV[1]
end

yml_file = []
yml_temp = []
File.open(ARGV[0],'r') do |file|
  while lines = file.gets
    yml_temp << lines.gsub(/\n/,"")
  end
end
puts "#{yml_temp}"
  header = yml_temp[0].split("\t")
  # puts "#{header}"
  # puts "#{tsv_file}"
  yml_temp.shift
  yml_temp.each { |line|
    value = line.split("\t")
    temp = Hash.new
    header.each_index { |x| temp[header[x]] = value[x] }
    yml_file.push(temp)
  }

File.open(output_file, 'w') do |file|
  file.puts yml_file.to_yaml
end
