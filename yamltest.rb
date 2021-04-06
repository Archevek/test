require 'yaml/store'
@title = 'Results so far:'
@store = YAML::Store.new 'votes.yml'
p @store