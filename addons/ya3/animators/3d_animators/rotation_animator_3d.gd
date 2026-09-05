@tool
extends Animator3D
class_name RotationAnimator3D

@export
var rotation_degree: Vector3 = Vector3(0, 0, 0)


func _animation_implementation(reverse := false) -> PropertyTweener:
	parent.rotation_degrees = rotation_degree if reverse else Vector3.ZERO
	
	var property_tween := _tween.tween_property(
		parent,
		"rotation_degrees",
		Vector3.ZERO if reverse else rotation_degree,
		duration
	)
	return property_tween
