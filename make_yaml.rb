require 'json'
require 'yaml'

a = JSON.parse(File.read("./organizations-connector.json"))
b = []

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
end

b = b.to_yaml(line_width: -1)
File.write('organizations.yml', b)
