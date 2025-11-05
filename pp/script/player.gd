extends CharacterBody2D

var speed = 300.0
var jump_speed = -400.0; var jump_num = 2;
var gravity = 800.0; var terminal_speed = 800.0;

func _physics_process(delta):
    if velocity.y < terminal_speed:
        velocity.y += gravity * delta
    
    if is_on_floor():
        jump_num = 2

    if Input.is_action_just_pressed("jump"):
        if jump_num > 0:
            velocity.y = jump_speed
            jump_num -= 1
            
    var direction = Input.get_axis("ui_left", "ui_right")
    velocity.x = direction * speed

    move_and_slide()
