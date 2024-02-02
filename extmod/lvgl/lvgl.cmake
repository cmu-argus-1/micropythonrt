set(LV_CONF_PATH ${MICROPY_PORT_DIR}/lv_conf.h)

set(LV_CONF_BUILD_DISABLE_THORVG_INTERNAL ON)
set(LV_CONF_BUILD_DISABLE_EXAMPLES ON)
set(LV_CONF_BUILD_DISABLE_DEMOS ON)

add_subdirectory(${MICROPY_DIR}/lib/lvgl lvgl)

add_library(mp_lvgl INTERFACE)
target_sources(mp_lvgl INTERFACE
    ${MICROPY_DIR}/extmod/lvgl/drivers/lv_ili9341_disp.c
    ${MICROPY_DIR}/extmod/lvgl/drivers/lv_ft6206_indev.c

    ${MICROPY_DIR}/extmod/lvgl/display.c
    ${MICROPY_DIR}/extmod/lvgl/ft6206.c
    ${MICROPY_DIR}/extmod/lvgl/ili9341.c
    ${MICROPY_DIR}/extmod/lvgl/indev.c
    ${MICROPY_DIR}/extmod/lvgl/modlvgl.c
    ${MICROPY_DIR}/extmod/lvgl/obj.c
    ${MICROPY_DIR}/extmod/lvgl/obj_class.c
    ${MICROPY_DIR}/extmod/lvgl/queue.c
    ${MICROPY_DIR}/extmod/lvgl/style.c
    ${MICROPY_DIR}/extmod/lvgl/super.c
    ${MICROPY_DIR}/extmod/lvgl/widgets.c
)

target_link_libraries(mp_lvgl INTERFACE
    lvgl
)

set_source_files_properties(
    ${MICROPY_DIR}/extmod/lvgl/display.c
    ${MICROPY_DIR}/extmod/lvgl/ft6206.c
    ${MICROPY_DIR}/extmod/lvgl/ili9341.c
    ${MICROPY_DIR}/extmod/lvgl/indev.c
    ${MICROPY_DIR}/extmod/lvgl/modlvgl.c
    ${MICROPY_DIR}/extmod/lvgl/obj.c
    ${MICROPY_DIR}/extmod/lvgl/obj_class.c
    ${MICROPY_DIR}/extmod/lvgl/queue.c
    ${MICROPY_DIR}/extmod/lvgl/style.c
    ${MICROPY_DIR}/extmod/lvgl/super.c
    ${MICROPY_DIR}/extmod/lvgl/widgets.c

    PROPERTIES MICROPY_SOURCE_QSTR ON
)
