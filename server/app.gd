extends RefCounted
class_name App

static var htmxHead = GDML.Head({
		  "children": GDML.Fragment([
			GDML.Meta({
			  "attr": { "charset": "UTF-8" }
			}),
			GDML.Meta({
			  "attr": { "name": "viewport", "content": "width=device-width, initial-scale=1.0" }
			}),
			GDML.Title({
			  "children": "Godot + Htmx"
			}),
			GDML.ScriptTag({
				"children": "// just to test",
				 "attr": {
					"src": "https://unpkg.com/htmx.org@1.9.12",
					"integrity": "sha384-ujb1lZYygJmzgSwoxRggbCHcjc0rB2XoQrxeTUQyRjrOnlCoYta87iKBWq3EsdM2",
					"crossorigin": "anonymous"
			  }
			})
		  ])
		})

static func home(_request: GeckoHttpRequest, response: GeckoHttpResponse):
	var docType = "<!DOCTYPE html>"
	var html = GDML.Html({
	  "attr": { "lang": "en" },
	  "children": GDML.Fragment([
		htmxHead,
		GDML.Body({
		  "children": GDML.Fragment([
			GDML.H1({
				"children": "HTMX + Godot????"
			}),
			GDML.Br(),
			# custom templating system in GDSCRIPT!
			GDML.Div({
			  "children": GDML.Fragment([
				GDML.P({
				  "attr": { "id": "count" },
				  "children": "Current count: %s" % State.count
				}),
				# sweet htmx!
				GDML.Button({
				  "attr": {
					"hx-swap": "outerHTML",
					"hx-target": "#count",
					"hx-post": "/count",
				  },
				  "children": "Count"
				})
			  ])
			})
		  ])
		})
	  ])
	});

	var page = GDML.Fragment(
		[
			docType,
			html
		]
	)

	
	response.send(200, page)

static func count(_request: GeckoHttpRequest, response: GeckoHttpResponse):
	State.increment_count()
	var html = 	GDML.P({
		  "attr": { "id": "count" },
		  "children": "Current count: %s" % State.get_count()
	})
	
	response.send(200, html)
	
