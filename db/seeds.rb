# raise 'Сиды предназначены только для development-базы! Для других окружений это опасно!' unless Rails.env.development?

puts 'Creating projects...'
project_upwork = Project.create title: 'Upwork'
project_storm = Project.create title: 'Storm'
project_sport = Project.new title: 'Спорт | план тренировок'
project_l2_erde_visa = Project.create title: 'L2 Erde (visa app)'

puts 'Creating tasks...'

# Задачи без назначенного проекта

task_unattached_1 = Task.create title: 'Создать rails-модельку task для storm-приложения',
                              task_state: 'incoming',
                              project: nil,
                              body: 'Тело задачи: Создать rails-модельку task для storm-приложения',
                              deadline_at: nil

task_unattached_2 = Task.create title: 'Разработать схему базы данных для storm-приложения',
                             task_state: 'incoming',
                             project: nil,
                             body: 'Тело задачи: Создать rails-модельку task для storm-приложения',
                             deadline_at: '2021-03-01'




# Задачи для занятий спортом

task_sport_1 = Task.create title: 'Сделать сегодня 3 подхода по 10 приседаний',
                             task_state: 'todo',
                             project: project_sport,
                             body: 'Тело задачи: Сделать сегодня 3 подхода по 10 приседаний',
                             deadline_at: '2021-03-01'

task_sport_2 = Task.create title: 'Пробежать 3 км',
                        task_state: 'in_process',
                        project: project_sport,
                        body: 'Тело задачи: Пробежать 3 км',
                        deadline_at: '2021-03-01'


# Upwork project
# task_upwork_1 = Task.new title: 'Сверстать PSD-макет',
task_upwork_2 = Task.create title: 'Create html-layout from psd-file',
  task_state: 'in_process',
  project: project_upwork,
  body: 'Тело задачи: Create html-layout from psd-file',
  deadline_at: '2021-03-01'


puts 'DONE.'
