extends ControlAnimator
class_name SlideAnimator


@export var direction: Vector2 = Vector2(-1, 0)


func _animation_implementation(reverse := false) -> PropertyTweener:
	parent.offset_transform_enabled = true
	var direction_factor: float = (max(get_viewport().get_visible_rect().size.x, get_viewport().get_visible_rect().size.y) + max(parent.size.x, parent.size.y)) / 2
	
	var orig_pos = parent.offset_transform_position
	var trgt_pos = parent.offset_transform_position + direction * direction_factor
	
	parent.offset_transform_position = trgt_pos if reverse else orig_pos
	
	var property_tween := _tween.tween_property(
		parent,
		"offset_transform_position",
		orig_pos if reverse else trgt_pos,
		duration
	)
	
	match loop:
		LoopType.LOOP:
			_tween.set_loops()
			_tween.tween_property(
				parent,
				"offset_transform_position",
				trgt_pos if reverse else orig_pos,
				0
			)
		LoopType.REVERSE:
			var rev := _tween.tween_property(
				parent,
				"offset_transform_position",
				trgt_pos if reverse else orig_pos,
				duration
			)
			rev.set_trans(transition_type)
			rev.set_ease(ease_type)
			_tween.set_loops()
	
	return property_tween
