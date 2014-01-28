require 'sinatra'
require 'sinatra/assetpack'
require 'parse_resource'
require 'haml'
require 'less'
require 'redcarpet'

parse = YAML.load(File.read("parse.yml"))
ParseResource::Base.load!(parse['app_id'], parse['master_key'])

set :root, File.dirname(__FILE__) # You must set app root
set :haml, :format => :html5

register Sinatra::AssetPack

assets {
  Less.paths << "css"
  serve 'css', from: 'css'
  css :style, 'css/style.css', ['css/style.css']

  serve 'js', from: 'js'
  js :main, 'js/app.js', ['http://code.jquery.com/jquery-1.9.1.js', 'js/*.js']
  prebuild true
}

require_relative 'models/items'
require_relative 'server'
require_relative 'admin'
