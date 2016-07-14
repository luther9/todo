user = User.create! name: 'regularuser', password: 'qwertyui'
list = List.create! user: user, title: 'Before Wednesday', permission: 'private_'
item = Item.create! list: list, body: 'Become President'

puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"
