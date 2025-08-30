extends Camera3D

@onready var node_kart = get_node('../Kart')

func _process(delta):
    var back = Vector3.FORWARD.rotated(Vector3.UP, node_kart.rotate_angle)
    position.x = node_kart.position.x + back.x * 2.0
    position.y = node_kart.position.y + 3.0
    position.z = node_kart.position.z + back.z * 2.0
    rotation.y = node_kart.rotate_angle + PI
