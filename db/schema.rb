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

ActiveRecord::Schema.define(version: 20171122160436) do

  create_table "asistencias", force: :cascade do |t|
    t.integer "estado"
    t.integer "recargo_horas"
    t.datetime "deleted_at"
    t.integer "jornada_id"
    t.integer "empleado_id"
    t.integer "programa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_asistencias_on_deleted_at"
    t.index ["empleado_id"], name: "index_asistencias_on_empleado_id"
    t.index ["jornada_id", "empleado_id"], name: "index_asistencias_on_jornada_id_and_empleado_id", unique: true
    t.index ["jornada_id"], name: "index_asistencias_on_jornada_id"
    t.index ["programa_id"], name: "index_asistencias_on_programa_id"
  end

  create_table "consumos", force: :cascade do |t|
    t.integer "cantidad"
    t.decimal "km_desde"
    t.decimal "km_hasta"
    t.datetime "deleted_at"
    t.integer "jornada_id"
    t.integer "programa_id"
    t.integer "recurso_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_cuadrillas_on_deleted_at"
  end

  create_table "empleados", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.datetime "deleted_at"
    t.integer "asistencias_count", default: 0, null: false
    t.integer "cuadrilla_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cuadrilla_id"], name: "index_empleados_on_cuadrilla_id"
    t.index ["deleted_at"], name: "index_empleados_on_deleted_at"
  end

  create_table "jornadas", force: :cascade do |t|
    t.date "fecha"
    t.decimal "km_desde", precision: 10, scale: 3
    t.decimal "km_hasta", precision: 10, scale: 3
    t.integer "programa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["programa_id"], name: "index_jornadas_on_programa_id"
  end

  create_table "programas", force: :cascade do |t|
    t.date "desde"
    t.date "hasta"
    t.string "capataz"
    t.string "inspector"
    t.integer "dotacion_original"
    t.integer "dotacion_real"
    t.text "observaciones"
    t.datetime "deleted_at"
    t.integer "jornadas_count", default: 0, null: false
    t.integer "trabajos_count", default: 0, null: false
    t.integer "via_id"
    t.integer "cuadrilla_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cuadrilla_id"], name: "index_programas_on_cuadrilla_id"
    t.index ["deleted_at"], name: "index_programas_on_deleted_at"
    t.index ["via_id"], name: "index_programas_on_via_id"
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

  create_table "tareas", force: :cascade do |t|
    t.string "nombre"
    t.string "unidad"
    t.datetime "deleted_at"
    t.integer "trabajos_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_tareas_on_deleted_at"
  end

  create_table "trabajos", force: :cascade do |t|
    t.integer "cantidad_ejecutada"
    t.integer "cantidad_estimada"
    t.decimal "km_desde", precision: 10, scale: 3
    t.decimal "km_hasta", precision: 10, scale: 3
    t.datetime "deleted_at"
    t.string "type"
    t.integer "jornada_id"
    t.integer "programa_id"
    t.integer "tarea_id"
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

  create_table "vias", force: :cascade do |t|
    t.string "nombre"
    t.datetime "deleted_at"
    t.integer "programas_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_vias_on_deleted_at"
  end

end
