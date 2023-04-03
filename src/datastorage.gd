extends Node2D
export (String) var filename
export (String) var datatype
#make packed string data to be able to store data for different things and create multiple save files
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	file.open(filename, File.WRITE)
	
	if datatype == "player":
		








### Check if there is a saved file
##var file = File.new()

func write_data():
	# Construct a dictionary with whatever data you want
var data = {
	player_level = 42,
	last_item = "sword"
}

# Open a file

	if file.open("user://saved_game.sav", File.WRITE) != 0:
 		   print("Error opening file")
 		   return

# Save the dictionary as JSON (or whatever you want, JSON is convenient here because it's built-in)
	file.store_line(data.to_json())
	file.close()
	
	
func read_data():	
	if not file.file_exists("user://saved_game.sav"):
   	 print("No file saved!")
  	  return

# Open existing file
	if file.open("user://saved_game.sav", File.READ) != 0:
  	  print("Error opening file")
   	 return

# Get the data
	var data = {}
	data.parse_json(file.get_line())

# Then do what you want with the data



# Check if there is a saved file
##var file = File.new()
##if not file.file_exists("user://saved_game.sav"):
##    print("No file saved!")
##    return

# Open existing file
##if file.open("user://saved_game.sav", File.READ) != 0:
 ##   print("Error opening file")
   ## return

# Get the data
##var data = {}
##data.parse_json(file.get_line())

# Then do what you want with the data
