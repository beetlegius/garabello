# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180122115922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asistencias", force: :cascade do |t|
    t.integer "estado"
    t.integer "recargo_horas"
    t.datetime "deleted_at"
    t.bigint "jornada_id"
    t.bigint "empleado_id"
    t.bigint "programa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_asistencias_on_deleted_at"
    t.index ["empleado_id"], name: "index_asistencias_on_empleado_id"
    t.index ["jornada_id", "empleado_id"], name: "index_asistencias_on_jornada_id_and_empleado_id", unique: true
    t.index ["jornada_id"], name: "index_asistencias_on_jornada_id"
    t.index ["programa_id"], name: "index_asistencias_on_programa_id"
  end

  create_table "cips", force: :cascade do |t|
    t.string "codigo"
    t.string "nombre"
    t.datetime "deleted_at"
    t.integer "productos_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["codigo"], name: "index_cips_on_codigo", unique: true
    t.index ["deleted_at"], name: "index_cips_on_deleted_at"
  end

  create_table "consumos", force: :cascade do |t|
    t.integer "cantidad"
    t.decimal "km_desde"
    t.decimal "km_hasta"
    t.datetime "deleted_at"
    t.bigint "jornada_id"
    t.bigint "programa_id"
    t.bigint "recurso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_consumos_on_deleted_at"
    t.index ["jornada_id"], name: "index_consumos_on_jornada_id"
    t.index ["programa_id"], name: "index_consumos_on_programa_id"
    t.index ["recurso_id"], name: "index_consumos_on_recurso_id"
  end

  create_table "cuadrillas", force: :cascade do |t|
    t.string "nombre"
    t.integer "sector"
    t.datetime "deleted_at"
    t.integer "empleados_count", default: 0, null: false
    t.integer "programas_count", default: 0, null: false
    t.bigint "tipo_programa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_cuadrillas_on_deleted_at"
    t.index ["tipo_programa_id"], name: "index_cuadrillas_on_tipo_programa_id"
  end

  create_table "empleados", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.datetime "deleted_at"
    t.integer "asistencias_count", default: 0, null: false
    t.bigint "cuadrilla_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cuadrilla_id"], name: "index_empleados_on_cuadrilla_id"
    t.index ["deleted_at"], name: "index_empleados_on_deleted_at"
  end

  create_table "items_movimiento", force: :cascade do |t|
    t.decimal "cantidad", precision: 15, scale: 2, default: "1.0"
    t.datetime "deleted_at"
    t.bigint "movimiento_id"
    t.bigint "producto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_items_movimiento_on_deleted_at"
    t.index ["movimiento_id"], name: "index_items_movimiento_on_movimiento_id"
    t.index ["producto_id"], name: "index_items_movimiento_on_producto_id"
  end

  create_table "items_solicitud", force: :cascade do |t|
    t.decimal "cantidad", precision: 15, scale: 2
    t.datetime "deleted_at"
    t.bigint "producto_id"
    t.bigint "solicitud_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_items_solicitud_on_deleted_at"
    t.index ["producto_id"], name: "index_items_solicitud_on_producto_id"
    t.index ["solicitud_id"], name: "index_items_solicitud_on_solicitud_id"
  end

  create_table "jornadas", force: :cascade do |t|
    t.date "fecha"
    t.decimal "km_desde", precision: 10, scale: 3
    t.decimal "km_hasta", precision: 10, scale: 3
    t.bigint "programa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["programa_id"], name: "index_jornadas_on_programa_id"
  end

  create_table "movimientos", force: :cascade do |t|
    t.date "fecha"
    t.string "remito"
    t.boolean "esta_confirmado", default: false
    t.string "type"
    t.integer "items_count", default: 0, null: false
    t.datetime "deleted_at"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_movimientos_on_deleted_at"
    t.index ["user_id"], name: "index_movimientos_on_user_id"
  end

  create_table "novedades_solicitud", force: :cascade do |t|
    t.date "fecha"
    t.text "contenido"
    t.datetime "deleted_at"
    t.bigint "solicitud_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_novedades_solicitud_on_deleted_at"
    t.index ["solicitud_id"], name: "index_novedades_solicitud_on_solicitud_id"
    t.index ["user_id"], name: "index_novedades_solicitud_on_user_id"
  end

  create_table "productos", force: :cascade do |t|
    t.string "codigo"
    t.string "nombre"
    t.string "unidad"
    t.boolean "esta_seleccionado", default: false
    t.datetime "deleted_at"
    t.decimal "cantidad", precision: 15, scale: 2, default: "0.0"
    t.bigint "cip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nombre_planilla"
    t.index ["cip_id"], name: "index_productos_on_cip_id"
    t.index ["codigo"], name: "index_productos_on_codigo", unique: true
    t.index ["deleted_at"], name: "index_productos_on_deleted_at"
    t.index ["esta_seleccionado"], name: "index_productos_on_esta_seleccionado"
  end

  create_table "programas", force: :cascade do |t|
    t.date "desde"
    t.date "hasta"
    t.string "capataz"
    t.string "inspector"
    t.text "observaciones"
    t.datetime "deleted_at"
    t.integer "jornadas_count", default: 0, null: false
    t.integer "trabajos_count", default: 0, null: false
    t.bigint "user_id"
    t.bigint "ramal_id"
    t.bigint "cuadrilla_id"
    t.bigint "tipo_programa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cuadrilla_id"], name: "index_programas_on_cuadrilla_id"
    t.index ["deleted_at"], name: "index_programas_on_deleted_at"
    t.index ["ramal_id"], name: "index_programas_on_ramal_id"
    t.index ["tipo_programa_id"], name: "index_programas_on_tipo_programa_id"
    t.index ["user_id"], name: "index_programas_on_user_id"
  end

  create_table "ramales", force: :cascade do |t|
    t.string "nombre"
    t.datetime "deleted_at"
    t.integer "programas_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_ramales_on_deleted_at"
  end

  create_table "recursos", force: :cascade do |t|
    t.string "nombre"
    t.string "unidad"
    t.datetime "deleted_at"
    t.integer "consumos_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_recursos_on_deleted_at"
  end

  create_table "recursos_tipos_programa", id: false, force: :cascade do |t|
    t.bigint "recurso_id", null: false
    t.bigint "tipo_programa_id", null: false
    t.index ["recurso_id", "tipo_programa_id"], name: "index_recursos_tipos_programa", unique: true
  end

  create_table "solicitudes", force: :cascade do |t|
    t.date "fecha"
    t.string "lugar"
    t.string "codigo_requerimiento"
    t.integer "categoria"
    t.integer "estado"
    t.integer "urgencia"
    t.integer "items_count", default: 0, null: false
    t.integer "novedades_count", default: 0, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_solicitudes_on_deleted_at"
  end

  create_table "tareas", force: :cascade do |t|
    t.string "nombre"
    t.string "unidad"
    t.decimal "esfuerzo", precision: 12, scale: 8
    t.datetime "deleted_at"
    t.integer "trabajos_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_tareas_on_deleted_at"
  end

  create_table "tareas_tipos_programa", id: false, force: :cascade do |t|
    t.bigint "tarea_id", null: false
    t.bigint "tipo_programa_id", null: false
    t.index ["tarea_id", "tipo_programa_id"], name: "index_tarea_tipos_programa", unique: true
  end

  create_table "tipos_programa", force: :cascade do |t|
    t.string "nombre"
    t.datetime "deleted_at"
    t.integer "programas_count", default: 0, null: false
    t.integer "cuadrillas_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_tipos_programa_on_deleted_at"
  end

  create_table "trabajos", force: :cascade do |t|
    t.integer "cantidad_ejecutada"
    t.integer "cantidad_estimada"
    t.decimal "km_desde", precision: 10, scale: 3
    t.decimal "km_hasta", precision: 10, scale: 3
    t.datetime "deleted_at"
    t.string "type"
    t.bigint "jornada_id"
    t.bigint "programa_id"
    t.bigint "tarea_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_trabajos_on_deleted_at"
    t.index ["jornada_id", "tarea_id"], name: "index_trabajos_on_jornada_id_and_tarea_id"
    t.index ["jornada_id"], name: "index_trabajos_on_jornada_id"
    t.index ["programa_id"], name: "index_trabajos_on_programa_id"
    t.index ["tarea_id"], name: "index_trabajos_on_tarea_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "deleted_at"
    t.string "name"
    t.string "role"
    t.string "image_uid"
    t.string "image_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "asistencias", "empleados"
  add_foreign_key "asistencias", "jornadas"
  add_foreign_key "asistencias", "programas"
  add_foreign_key "consumos", "jornadas"
  add_foreign_key "consumos", "programas"
  add_foreign_key "consumos", "recursos"
  add_foreign_key "cuadrillas", "tipos_programa"
  add_foreign_key "empleados", "cuadrillas"
  add_foreign_key "items_movimiento", "movimientos"
  add_foreign_key "items_movimiento", "productos"
  add_foreign_key "items_solicitud", "productos"
  add_foreign_key "items_solicitud", "solicitudes"
  add_foreign_key "jornadas", "programas"
  add_foreign_key "movimientos", "users"
  add_foreign_key "novedades_solicitud", "solicitudes"
  add_foreign_key "novedades_solicitud", "users"
  add_foreign_key "productos", "cips"
  add_foreign_key "programas", "cuadrillas"
  add_foreign_key "programas", "ramales"
  add_foreign_key "programas", "tipos_programa"
  add_foreign_key "programas", "users"
  add_foreign_key "trabajos", "jornadas"
  add_foreign_key "trabajos", "programas"
  add_foreign_key "trabajos", "tareas"
end
