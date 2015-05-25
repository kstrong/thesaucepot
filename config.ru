require './app'

run Rack::URLMap.new(
  '/thesaucepot' => SaucePotApp.new
)
