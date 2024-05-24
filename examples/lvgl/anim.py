import lvgl


# Start animation on an event
def anim_1():
    def sw_event_cb(e):
        if sw.state & lvgl.STATE_CHECKED:
            lvgl.Anim(
                var=label,
                start_value=label.x,
                end_value=100,
                duration=500,
                props=["x"],
                path_cb=lvgl.AnimPath.OVERSHOOT,
            ).start()
        else:
            lvgl.Anim(
                var=label,
                start_value=label.x,
                end_value=-label.width,
                duration=500,
                props=["x"],
                path_cb=lvgl.AnimPath.EASE_IN,
            ).start()

    label = lvgl.Label(
        text="Hello animations!",
        x=100,
        y=10,
    )

    sw = lvgl.Switch(align=lvgl.ALIGN_CENTER)
    sw.update_state(lvgl.STATE_CHECKED, True)
    sw.add_event(sw_event_cb, lvgl.EVENT_VALUE_CHANGED)


# Create a playback animation
def anim_2():
    obj = lvgl.Object(
        bg_color=lvgl.Palette.RED.main(),
        radius=lvgl.RADIUS_CIRCLE,
        align=lvgl.ALIGN_LEFT_MID,
        x=10,
        y=0,
    )

    a = lvgl.Anim(
        var=obj,
        start_value=10,
        end_value=50,
        duration=1000,
        playback_delay=100,
        playback_duration=300,
        repeat_delay=500,
        repeat_count=0xFFFF,  # LV_ANIM_REPEAT_INFINITE
        path_cb=lvgl.AnimPath.EASE_IN_OUT,
    )

    lvgl.Anim(a, props=["width", "height"]).start()
    lvgl.Anim(a, props=["x"], start_value=10, end_value=240).start()
