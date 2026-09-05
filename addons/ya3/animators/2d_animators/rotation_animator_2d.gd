@tool
extends Animator2D
class_name RotationAnimator2D

@export
var rotation_degree: float = 0.0


func _animation_implementation(reverse := false) -> PropertyTweener:
	parent.rotation_degrees = rotation_degree if reverse else 0.0
	
	var property_tween := _tween.tween_property(
		parent,
		"rotation_degrees",
		0.0 if reverse else rotation_degree,
		duration
	)
	return property_tween
