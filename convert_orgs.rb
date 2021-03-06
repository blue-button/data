require 'json'
fmh = 0
myc = 0
b = []

a = JSON.parse(File.read("./organizations-connector.json"))

a.each do |h|
  c = {
    'id'          => h['id'],
    'name'        => h['organization'],
    'description' => h['description'],
    'category'    => h['category'],
    'states'      => h['states'],
    'url'         => h['url'],
    'view'        => h['view'],
    'download'    => h['download'],
    'transmit'    => h['transmit']
  }
  
  b << c
  
  if h['url'].include? "followmyhealth"
    fmh += 1
    if h['transmit']
      puts h
    end
  elsif h['url'].include? "mychart"
    myc += 1
  end
end

b = JSON.pretty_generate(b)

File.write('organizations.json', b)

puts "#{a.length} organizations"
puts "#{fmh} fmh"
puts "#{myc} mychart"
