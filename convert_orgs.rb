require 'json'

b = []

a = JSON.parse(File.read("./organizations-connector.json"))

a.each do |h|
  c = {
    'id'          => h['id'],
    'name'        => h['organization'],
    'description' => h['description'],
    'category'    => h['category'],
    'states'      => h['states'],
    'view'        => h['view'],
    'download'    => h['download'],
    'transmit'    => h['transmit']
  }
  
  b << c
end

b = JSON.pretty_generate(b)

File.write('organizations.json', b)
