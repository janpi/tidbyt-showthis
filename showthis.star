load("render.star", "render")
load("http.star", "http")
load("encoding/base64.star", "base64")
load("cache.star", "cache")
load("schema.star", "schema")

def main(config):

	cache_ttl_sec = 300

	text_large = "Large text"
	text_small = "Small text"
	text_left = "Left text"
	text_right = "Right text"
	icon = "iVBORw0KGgoAAAANSUhEUgAAAA0AAAANCAYAAABy6+R8AAAAKklEQVQokWNgGDrg2TOb/8+e2fwnJEa5JvoDmJOIdhY2P5GkgWiNgwsAAIg6LWr4ZNyAAAAAAElFTkSuQmCC"

	if cache.get("text_large") != None:
		print("Hit! Displaying cached data.")

		text_large = cache.get("text_large")
		text_small = cache.get("text_small")
		text_left = cache.get("text_left")
		text_right = cache.get("text_right")
		icon = cache.get("icon")

	else:
		print("No cache => Querying web service...")

		url = config.get("url")

		# url = "test"

		if url == "" or url == None:
			print("Error: No URL configured")

			text_large = "URL"
			text_small = "missing"
			text_left = "ShowThis App"
			text_right = ""
			icon = icon
	
		else:
			
			if url == "test":
				url = "https://hook.integromat.com/ujwv9g2ug7budr8stcb5tvn9bjtrrb5m"

			rep = http.get(url)
		
			if rep.status_code == 200:
				text_large = rep.json()["text_large"]
				text_small = rep.json()["text_small"]
				text_left = rep.json()["text_left"]
				text_right = rep.json()["text_right"]
				icon = rep.json()["icon"]

				cache.set("text_large", text_large, ttl_seconds=cache_ttl_sec)
				cache.set("text_small", text_small, ttl_seconds=cache_ttl_sec)
				cache.set("text_left", text_left, ttl_seconds=cache_ttl_sec)
				cache.set("text_right", text_right, ttl_seconds=cache_ttl_sec)
				cache.set("icon", icon, ttl_seconds=cache_ttl_sec)

			else:
				fail("Service request failed with status %d", rep.status_code)

				text_large = rep.json()["text_large"]
				text_small = rep.json()["text_small"]
				text_left = rep.json()["text_left"]
				text_right = rep.json()["text_right"]
				icon = rep.json()["icon"]


	return render.Root(
		child = render.Stack(
			children = [
				render.Column(
					expanded=True,
					main_align="start",
					children = [ 
						render.Padding(
							pad=1,
							child=render.Row(
								expanded=True,
								main_align="space_between",
								children = [ 
									render.Text(content=text_left, font="CG-pixel-3x5-mono", color="#999999"),
									render.Text(content=text_right, font="CG-pixel-3x5-mono", color="#999999")
								]
							)
						)
					]
				),
				render.Column(
					expanded=True,
					main_align="center",
					children = [ 
						render.Row(
							expanded=True,
							main_align="space_evenly",
							children = [ 
								render.Image(src=base64.decode(icon), width=13, height=13),
								render.Text(content=text_large, font="6x13") 
							]
						)
					]
				),
				render.Column(
					expanded=True,
					main_align="end",
					children = [ 
						render.Row(
							expanded=True,
							main_align="center",
							children = [ 
								render.Padding(
									child=render.Text(text_small, font="5x8"),
									pad=1
								)
							]
						)
					]
				)
			]
		)
	)
    
    
def get_schema():
	return schema.Schema(
		version = "1",
		fields = [
			schema.Text(
				id = "url",
				name = "URL",
				desc = "URL to query, returning a JSON object",
				icon = "link",
			)
		]
	)

 
