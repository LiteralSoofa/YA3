@tool
extends ControlAnimator
class_name ScaleAnimator

@export var scale_before: Vector2 = Vector2.ZERO
@export var scale_after: Vector2 = Vector2.ONE


func _ready() -> void:
	super._ready()
	
	if parent is Container:
		push_warning(
			"ScaleAnimator may not work as expected because its parent's layout is controlled by a Container."
		)


func _animation_implementation(reverse := false) -> PropertyTweener:
	parent.pivot_offset_ratio = Vector2(0.5, 0.5)
	parent.scale = scale_after if reverse else scale_before
	
	var property_tween := _tween.tween_property(
		parent,
		"scale",
		scale_before if reverse else scale_after,
		duration
	)
	
	return property_tween
