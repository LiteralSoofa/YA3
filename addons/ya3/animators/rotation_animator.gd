extends Animator
class_name RotationAnimator

@export var rotation_degree := 360


func _animation_implementation(reverse := false) -> PropertyTweener:
	parent.pivot_offset_ratio = Vector2(0.5, 0.5)
	parent.rotation_degrees = rotation_degree if reverse else 0.0
	
	var property_tween := _tween.tween_property(
		parent,
		"rotation_degrees",
		0.0 if reverse else rotation_degree,
		duration
	)
	return property_tween
