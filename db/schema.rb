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

ActiveRecord::Schema[7.0].define(version: 2023_05_18_233744) do
  create_table "criterios", primary_key: "pk_criterio", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "descripcion_criterio"
    t.integer "valor_criterio"
    t.bigint "fk_encuesta_id", null: false
    t.bigint "fk_tipo_criterio_id", null: false
    t.index ["fk_encuesta_id"], name: "index_criterios_on_fk_encuesta_id"
    t.index ["fk_tipo_criterio_id"], name: "index_criterios_on_fk_tipo_criterio_id"
  end

  create_table "encuestas", primary_key: "pk_encuesta", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "titulo_encuesta"
    t.text "objetivo_encuesta"
    t.text "indicacion_encuesta"
    t.datetime "fecha_creacion_encuesta"
    t.datetime "fecha_actualizacion_encuesta"
    t.string "link_encuesta"
    t.boolean "estado_encuesta"
    t.datetime "fecha_inicio_encuesta"
    t.datetime "fecha_finalizacion_encuesta"
  end

  create_table "tipo_criterios", primary_key: "pk_tipo_criterio", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "nombre_tipo_criterios"
  end

  add_foreign_key "criterios", "encuestas", column: "fk_encuesta_id", primary_key: "pk_encuesta"
  add_foreign_key "criterios", "tipo_criterios", column: "fk_tipo_criterio_id", primary_key: "pk_tipo_criterio"
end
