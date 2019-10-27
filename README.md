# Building a simple API for POKEAPI

## How to fetch data from pokemons

Just got to the website https://pokeapi.co/ and search for the data you want to fetch

For this exercise i just used 3 ruby classes 'json', 'uri' and 'net/http'.


## Running


 If your model reference other model you just need to reference it ot as inside post_type.rb:

```#api.rb

ruby api.rb
  ```


## Improve the attack comparison when one or more pokemons has equal attack points

Use the <b>hp</b> points when this case happens and return the weakest pokemon with less hp points.

Commented: In this case cenario even with one or more pokemons with same attack points they will be compared using the HP points.
