require 'sinatra'
require 'sinatra/assetpack'
require 'parse_resource'
require 'haml'
require 'less'

parse = YAML.load(File.read("parse.yml"))
ParseResource::Base.load!(parse['app_id'], parse['master_key'])

set :root, File.dirname(__FILE__) # You must set app root
set :haml, :format => :html5

register Sinatra::AssetPack

assets {
  Less.paths << "css"
  serve 'css', from: 'css'
  css :style, 'css/style.css', ['css/style.css']
  prebuild true
}

require_relative 'routes'