namespace :puma do
  desc 'Start puma on server'
  task :start do
    on roles(:app) do
      within release_path do
        execute :bundle, "exec puma --daemon --config config/puma-production.rb"
      end
    end
  end

  desc 'Stop puma on server'
  task :stop do
    on roles(:app) do
      within release_path do
        pids = capture("ps --format='pid,command' -ax |grep puma").split("\n")

        # Example: [31105, 31114, 31118, 31122, 31126]
        pids.map!{|str| str.split(/\W+/).first.to_i }

        # remove zero-pids:
        #   [2661, 0, 0, 0, 0]
        pids.reject!{|e| e == 0}

        pids.each do |pid|
          execute "kill -s INT #{pid} || true"
        end
      end
    end
  end
end
