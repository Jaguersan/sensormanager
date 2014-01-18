# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140117120307) do

  create_table "categoria_equipos", force: true do |t|
    t.string "nombre",      limit: 50
    t.text   "descripcion", limit: 16777215
  end

  create_table "concentradors", force: true do |t|
    t.integer  "categoria_equipo_id"
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "estado"
    t.float    "gis_latitud",         default: 0.0
    t.float    "gis_longitud",        default: 0.0
    t.string   "mac_address"
    t.string   "numero_serie"
    t.string   "ip_address",          default: "80"
    t.integer  "ip_port"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "concentradors", ["categoria_equipo_id"], name: "index_concentradors_on_categoria_equipo_id", using: :btree

  create_table "medidas", force: true do |t|
    t.integer  "sensor_id",  default: 1
    t.date     "fecha"
    t.float    "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "medidas", ["sensor_id"], name: "index_medidas_on_sensor_id", using: :btree

  create_table "sensors", force: true do |t|
    t.integer  "concentrador_id", default: 1
    t.string   "nombre"
    t.string   "descripcion",     default: "--"
    t.string   "estado"
    t.string   "parametro"
    t.float    "valor",           default: 0.0
    t.string   "uds"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sensors", ["concentrador_id"], name: "index_sensors_on_concentrador_id", using: :btree

end
