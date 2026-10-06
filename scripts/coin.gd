extends Area2D


func _on_body_entered(body) -> void:
 print("plus + 1 coin")
 queue_free()
