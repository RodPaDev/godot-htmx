extends HttpRouter
class_name RootRouter

# Handle a GET request
func handle_get(request: HttpRequest, response: HttpResponse):
	var html = """
		<!DOCTYPE html>
		<html lang="en">
		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Godot + Htmx</title>
			<script src="https://unpkg.com/htmx.org@1.9.12" integrity="sha384-ujb1lZYygJmzgSwoxRggbCHcjc0rB2XoQrxeTUQyRjrOnlCoYta87iKBWq3EsdM2" crossorigin="anonymous"></script>
		</head>
		<body>
			<div>
				<p id="count">Current count: {current_count}</p>
				<button hx-swap="outerHTML" hx-target="#count" hx-post="/" hx-vals='{"increment": 1}'>Increment</button>
			</div>
		</body>
		</html>
	"""
	
	html = html.replace("{current_count}", str(State.get_count()))
	
	response.send(200, html)

func handle_post(request: HttpRequest, response: HttpResponse):
	State.increment_count()
	var html = """<p id="count">Current count: {current_count}</p>"""
	html = html.replace("{current_count}", str(State.get_count()))
	
	response.send(200, html)
	
