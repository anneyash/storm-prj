class Task < ApplicationRecord
  belongs_to :project, class_name: 'Project', optional: true

  validates_presence_of :title, :task_state

  enum task_state: {
    # Входящие
    incoming: 'incoming',

    # В процессе
    in_process: 'in_process',

    # Сделать
    todo: 'todo',

    # Задачи на сегодня
    today: 'today',

    # Готово - задача завершена
    done: 'done',
  }, _prefix: true


  # TODO: сделать валидацию, что проект должен быть указан во всех случаях, кроме  task_state == incoming

end
