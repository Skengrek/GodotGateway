extends Node


var network = NetworkedMultiplayerENet.new()
var ip = "127.0.0.1"
var port = 8991

func _ready():
	connectToServer()
	

func connectToServer():
	network.create_client(ip, port)
	get_tree().set_network_peer(network)
	
	network.connect('connection_failled', self, '_OnConnectionFailed')
	network.connect('connection_succeeded', self, '_OnConnectionSucceeded')
	
	
func _OnConnectionFailed():
	print('Failled')
	

func _OnConnectionSucceeded():
	print('Connected')


func authenticatePlayer(username, password, playerId):
	pass
	

remote func authenticationResult(result, playerId):
	pass
