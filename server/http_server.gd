extends Node
const BRUH = preload("res://bruh/bruh.tscn")


func _ready() -> void:
	var server = GeckoServer.new()
	server.GET("/", App.home)
	server.POST("/count", func(req, res):
		App.count(req,res)
		var bruh = BRUH.instantiate()
		var viewport_size = get_viewport().get_visible_rect().size
		var random_position = Vector2(
				randi_range(0, viewport_size.x),
				randi_range(0, viewport_size.y)
			)
		bruh.position = random_position
		self.add_child(bruh)
		
	)
	add_child(server)

	server.start_server(8080)
