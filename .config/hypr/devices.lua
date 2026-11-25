hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 0,
		accel_profile = "flat",
		sensitivity = -0.15, -- -1.0 - 1.0, 0 means no modification.
	},
	render = {
		cm_auto_hdr = 0,
		send_content_type = false,
	},
})
hl.monitor({
	output = "",
	mode = "highres",
	position = "auto",
	scale = "1.0",
})
