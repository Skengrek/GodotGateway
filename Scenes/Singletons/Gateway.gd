extends Node


var network = NetworkedMultiplayerENet.new()
var gatewayApi = MultiplayerAPI.new()
var port = 8992
var maxPlayers = 50

func _ready():
	startServer()
	

func startServer():
	network.create_server(port, maxPlayers)
	set_custom_multiplayer(gatewayApi)
	
	custom_multiplayer.set_root_node(self)
	custom_multiplayer.set_network_peer(network)
	
	
