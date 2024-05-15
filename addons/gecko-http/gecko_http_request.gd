# An HTTP request received by the server
extends RefCounted
class_name GeckoHttpRequest


# A dictionary of the headers of the request
var headers: Dictionary

# The received raw body
var body: String

# A match object of the regular expression that matches the path
var query_match: RegExMatch

# The path that matches the router path
var path: String

# The method
var method: String

# A dictionary of request (aka. routing) parameters
var parameters: Dictionary

# A dictionary of request query parameters
var query: Dictionary

# A regex identifiying the method line
var _method_regex: RegEx = RegEx.new()

# A regex for header lines
var _header_regex: RegEx = RegEx.new()

func _init(reqStr):
	# TODO these can be compiled on autoload
	_method_regex.compile("^(?<method>GET|POST|HEAD|PUT|PATCH|DELETE|OPTIONS) (?<path>[^ ]+) HTTP/1.1$")
	_header_regex.compile("^(?<key>[\\w-]+): (?<value>(.*))$")
	
	for line in reqStr.split("\r\n"):
		var method_matches = _method_regex.search(line)
		var header_matches = _header_regex.search(line)
		if method_matches:
			self.method = method_matches.get_string("method")
			var request_path: String = method_matches.get_string("path")
			# Check if request_path contains "?" character, could be a query parameter
			if not "?" in request_path:
				self.path = request_path
			else:
				var path_query: PackedStringArray = request_path.split("?")
				self.path = path_query[0]
				self.query = _extract_query_params(path_query[1])
			self.headers = {}
			self.body = ""
		elif header_matches:
			self.headers[header_matches.get_string("key")] = \
			header_matches.get_string("value")
		else:
			self.body += line

# Returns the body object based on the raw body and the content type of the request
func get_body_parsed() -> Variant:
	var content_type: String = ""
	
	if(headers.has("content-type")):
		content_type = headers["content-type"]
	elif(headers.has("Content-Type")):
		content_type = headers["Content-Type"]
		
	if(content_type == "application/json"):
		return JSON.parse_string(body)

	if(content_type == "application/x-www-form-urlencoded"):
		var data = {}
		
		for body_part in  body.split("&"):
			var key_and_value = body_part.split("=")
			data[key_and_value[0]] = key_and_value[1]
		
		return data
	
	# Not supported contenty type parsing... for now
	return null

# Override `str()` method, automatically called in `print()` function
func _to_string() -> String:
	return JSON.stringify({headers=headers, method=method, path=path})
	
# Extracts query parameters from a String query, 
# building a Query Dictionary of param:value pairs
#
# #### Parameters
# - query_string: the query string, extracted from the HttpRequest.path
#
# Returns: A Dictionary of param:value pairs
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
