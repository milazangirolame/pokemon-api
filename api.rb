require 'net/http'
require 'json'
require 'uri'

puts "Insira os nomes dos pokemons que você quer avaliar"
pokemons = []
while true
  input = gets.chomp
  input.downcase!
  break if input.empty?
  pokemons << input
end
puts "Pokemons: " + pokemons.join(", ")

h = {}

def get_attack(pokemon)
    print "Buscando pontos do pokemon inserido..."
    uri = URI('https://pokeapi.co/api/v2/pokemon/')
    uri.path += pokemon
    res = Net::HTTP.get_response(uri)
    resposta = JSON.parse(res.body)
    pokemons_attack = resposta['stats'][4]['base_stat']
    puts "O ataque do #{pokemon} é #{pokemons_attack}"
    return pokemons_attack
end

pokemons.each do |pokemon|

  h["#{pokemon}"] = get_attack(pokemon)
end
  resposta = h.sort_by{|k,v| v}

  puts "O pokemon mais fraco da sua lista é #{resposta[0][0].strip}"
