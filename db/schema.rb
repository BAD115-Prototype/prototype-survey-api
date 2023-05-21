# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_21_204922) do
  create_table "criterios", primary_key: "pk_criterio", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "descripcion_criterio", limit: 120
    t.integer "valor_criterio"
    t.bigint "fk_encuesta_id", null: false
    t.bigint "fk_tipo_criterio_id", null: false
    t.index ["fk_encuesta_id"], name: "index_criterios_on_fk_encuesta_id"
    t.index ["fk_tipo_criterio_id"], name: "index_criterios_on_fk_tipo_criterio_id"
  end

  create_table "encuestas", primary_key: "pk_encuesta", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "titulo_encuesta", limit: 120
    t.text "objetivo_encuesta"
    t.text "indicacion_encuesta"
    t.datetime "fecha_creacion_encuesta"
    t.datetime "fecha_actualizacion_encuesta"
    t.string "link_encuesta"
    t.boolean "estado_encuesta"
    t.datetime "fecha_inicio_encuesta"
    t.datetime "fecha_finalizacion_encuesta"
  end

  create_table "pantallas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "permiso_id", null: false
    t.string "nombre_pantalla", limit: 25
    t.string "url_pantalla"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permiso_id"], name: "index_pantallas_on_permiso_id"
  end

  create_table "permiso_rols", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "permiso_id", null: false
    t.bigint "rol_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permiso_id"], name: "index_permiso_rols_on_permiso_id"
    t.index ["rol_id"], name: "index_permiso_rols_on_rol_id"
  end

  create_table "permisos", primary_key: "pk_permiso", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre_permiso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personalizacion_encuestas", primary_key: "pk_personalizacion_encuesta", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "tipografia", limit: 100
    t.string "imagen"
    t.string "color_fondo", limit: 6
    t.string "color_principal", limit: 6
    t.bigint "fk_encuesta_id", null: false
    t.index ["fk_encuesta_id"], name: "index_personalizacion_encuestas_on_fk_encuesta_id"
  end

  create_table "rol_usuarios", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "usuario_id", null: false
    t.bigint "rol_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rol_id"], name: "index_rol_usuarios_on_rol_id"
    t.index ["usuario_id"], name: "index_rol_usuarios_on_usuario_id"
  end

  create_table "rols", primary_key: "pk_rol", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "descripcion_rol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_criterios", primary_key: "pk_tipo_criterio", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "nombre_tipo_criterios"
  end

  create_table "usuarios", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre_usuario"
    t.string "email"
    t.string "password_digest"
    t.boolean "activo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "criterios", "encuestas", column: "fk_encuesta_id", primary_key: "pk_encuesta"
  add_foreign_key "criterios", "tipo_criterios", column: "fk_tipo_criterio_id", primary_key: "pk_tipo_criterio"
  add_foreign_key "pantallas", "permisos", primary_key: "pk_permiso"
  add_foreign_key "permiso_rols", "permisos", primary_key: "pk_permiso"
  add_foreign_key "permiso_rols", "rols", primary_key: "pk_rol"
  add_foreign_key "personalizacion_encuestas", "encuestas", column: "fk_encuesta_id", primary_key: "pk_encuesta"
  add_foreign_key "rol_usuarios", "rols", primary_key: "pk_rol", name: "fk_rol"
  add_foreign_key "rol_usuarios", "usuarios"
end
