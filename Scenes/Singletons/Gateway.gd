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
	
	network.connect('peer_connected', self, '_Peer_Connected')
	network.connect('peer_disconnected', self, '_Peer_Disconnected')


func _Peer_Connected(gateway_id):
	print(str(gateway_id) + 'Connected')


func _Peer_Disconnected(gateway_id):
	print(str(gateway_id) + 'Disconnected')
