namespace :rails do
  desc 'Precompile assets'
  task :assets_precompile do
    on roles(:app) do
      within release_path do
        execute :bundle, "exec rake assets:precompile"
      end
    end
  end

  desc 'Migrate database'
  task :db_migrate do
    on roles(:app) do
      within release_path do
        execute :bundle, "exec rake db:migrate"
      end
    end
  end
end
