extends Animator
class_name ScaleAnimator



func _ready() -> void:
	super._ready()
	
	if parent.get_parent() is Container:
		push_warning(
			"ScaleAnimator may not work as expected because its parent's layout is controlled by a Container."
		)


func _animation_implementation(reverse := false) -> PropertyTweener:
	parent.pivot_offset_ratio = Vector2(0.5, 0.5)
	parent.scale = Vector2.ONE if reverse else Vector2.ZERO
	
	var property_tween := _tween.tween_property(
		parent,
		"scale",
		Vector2.ZERO if reverse else Vector2.ONE,
		duration
	)
	
	return property_tween
