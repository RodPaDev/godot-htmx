extends RefCounted
class_name Route

var method: String
var path: String
var handler: Callable

func _init(method: String, path: String, handler: Callable):
	self.method = method
	self.path = path
	self.handler = handler

func calL_handler(req: GeckoHttpRequest, res: GeckoHttpResponse):
	handler.call(req, res)
