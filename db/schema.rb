# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_19_100821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", comment: "Проекты", force: :cascade do |t|
    t.string "title", null: false
  end

  create_table "tasks", comment: "Задачи", force: :cascade do |t|
    t.string "title", null: false, comment: "Заголовок задачи"
    t.text "body", comment: "Тело задачи (подробное описание)"
    t.bigint "project_id", comment: "Задача может принадлежать проекту (но может пока еще и не принадлежать) "
    t.string "task_state", null: false, comment: "Тут будет перечень Колонок Доски:\n\n* todo (Сделать)\n* in_process (В процессе)\n* today (Задачи на сегодня)\n* incoming (Входящие)\n* done (Готово)"
    t.datetime "deadline_at", comment: "Дедлайн - т.е. дата, к которой нужно завершить задачу. Может быть NULL."
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
