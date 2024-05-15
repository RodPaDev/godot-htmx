extends Node
class_name GeckoServer

# HTTP Server setup
var server: TCPServer = TCPServer.new()
var clients: Array = []
var routes := {}

# list of host allowed to call the server
var _allowed_origins: PackedStringArray = []

# Comma separed methods for the access control
var _access_control_allowed_methods = "POST, GET, OPTIONS"

# Comma separed headers for the access control
var _access_control_allowed_headers = "content-type"

## TODO: Better error handling

func start_server(port):
	set_process(true)
	server.listen(port, "127.0.0.1")
	print("Server listening on port: %s" % port)
	
func GET(path: String, handler: Callable):
	if not routes.has("GET"):
		routes["GET"] = {}
	routes["GET"][path] = Route.new("GET", path, handler)

func POST(path: String, handler: Callable):
	if not routes.has("POST"):
		routes["POST"] = {}
	routes["POST"][path] = Route.new("POST", path, handler)

func HEAD(path: String, handler: Callable):
	if not routes.has("HEAD"):
		routes["HEAD"] = {}
	routes["HEAD"][path] = Route.new("HEAD", path, handler)

func PUT(path: String, handler: Callable):
	if not routes.has("PUT"):
		routes["PUT"] = {}
	routes["PUT"][path] = Route.new("PUT", path, handler)

func PATCH(path: String, handler: Callable):
	if not routes.has("PATCH"):
		routes["PATCH"] = {}
	routes["PATCH"][path] = Route.new("PATCH", path, handler)

func DELETE(path: String, handler: Callable):
	if not routes.has("DELETE"):
		routes["DELETE"] = {}
	routes["DELETE"][path] = Route.new("DELETE", path, handler)

func OPTIONS(path: String, handler: Callable):
	if not routes.has("OPTIONS"):
		routes["OPTIONS"] = {}
	routes["OPTIONS"][path] = Route.new("OPTIONS", path, handler)

func _process(delta):
	var client = server.take_connection()
	if client:
		clients.append(client)
		var received = client.get_available_bytes()
		if received > 0:
			var request = GeckoHttpRequest.new(client.get_string(received))
			var response = GeckoHttpResponse.new(client, request, _allowed_origins, _access_control_allowed_methods, _access_control_allowed_headers)
			route_request(request, response)


func route_request(req: GeckoHttpRequest, res: GeckoHttpResponse):
	if routes.has(req.method) and routes[req.method].has(req.path):
		var route = routes[req.method][req.path] as Route
		route.calL_handler(req, res)
	else:
		res.send(404, "404")

func _extract_query_params(query_string: String) -> Dictionary:
	var query: Dictionary = {}
	if query_string == "":
		return query
	var parameters: Array = query_string.split("&")
	for param in parameters:
		if not "=" in param:
			continue
		var kv : Array = param.split("=")
		var value: String = kv[1]
		if value.is_valid_int():
			query[kv[0]] = value.to_int()
		elif value.is_valid_float():
			query[kv[0]] = value.to_float()
		else:
			query[kv[0]] = value
	return query

func enable_cors(allowed_origins: PackedStringArray, access_control_allowed_methods : String = "POST, GET, OPTIONS", access_control_allowed_headers : String = "content-type"):
	_allowed_origins = allowed_origins
	_access_control_allowed_methods = access_control_allowed_methods
	_access_control_allowed_headers = access_control_allowed_headers
