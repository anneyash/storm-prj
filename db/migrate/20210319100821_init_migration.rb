class InitMigration < ActiveRecord::Migration[6.0]
  def change
    create_table "projects", force: :cascade, comment: "Проекты" do |t|
      t.string :title, null: false
    end

    create_table "tasks", force: :cascade, comment: "Задачи"  do |t|
      t.string :title, null: false, comment: "Заголовок задачи"
      t.text :body, comment: "Тело задачи (подробное описание)"
      t.bigint :project_id, null: true, comment: "Задача может принадлежать проекту (но может пока еще и не принадлежать) "
      t.string :task_state, null: false, comment: "Тут будет перечень Колонок Доски:\n\n* todo (Сделать)\n* in_process (В процессе)\n* today (Задачи на сегодня)\n* incoming (Входящие)\n* done (Готово)"
      t.datetime :deadline_at, comment: "Дедлайн - т.е. дата, к которой нужно завершить задачу. Может быть NULL."

      t.timestamps null: false
    end
  end
end
