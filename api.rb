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


def fetch_data(pokemon)
    uri = URI('https://pokeapi.co/api/v2/pokemon/')
    uri.path += pokemon
    res = Net::HTTP.get_response(uri)
    resposta = JSON.parse(res.body)
end
def get_attack(pokemon)
    pokemon_attack = fetch_data(pokemon)['stats'][4]['base_stat']
    return pokemon_attack
end
def get_hp(pokemon)
    pokemon_hp = fetch_data(pokemon)['stats'][5]['base_stat']
    return pokemon_hp
end
h = {}
pokemons.each do |pokemon|
    h = h.merge({
      pokemon => { :attack => get_attack(pokemon.downcase) , :hp =>get_hp(pokemon.downcase)}
      })
end

resposta = h.sort_by{|k,v| [v[:attack], v[:hp]]}
puts "O pokemon mais fraco da sua lista é #{resposta[0][0]}"
