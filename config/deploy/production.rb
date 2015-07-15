role :app, %w{deploy@104.236.63.176}
role :web, %w{deploy@104.236.63.176}
role :db, %w{deploy@104.236.63.176}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
server '104.236.63.176', user: 'deploy', roles: %w{web app db}
set :stage, :production