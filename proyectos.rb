require 'trello'
require 'yaml'

include Trello
include Trello::Authorization

#board
  #list.name
      #card.name
      #card.due

class Proyectos

  CONFIG = YAML::load(File.open("trello.yml")) unless defined? CONFIG

  def initialize
    Trello::Authorization.const_set :AuthPolicy, OAuthPolicy
    credential = OAuthCredential.new CONFIG['public_key'], CONFIG['private_key']
    OAuthPolicy.consumer_credential = credential
    OAuthPolicy.token = OAuthCredential.new CONFIG['access_token_key'], nil

    @proyectos = Board.find("5002043fb56da9d16247002a")
  end

  def lists
    return @proyectos.lists
  end

end
