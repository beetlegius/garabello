namespace :deploy do
  task :setup do
    on roles(:app) do
      execute "mkdir -p #{shared_path}/config"
      # upload! "config/database.example.yml", "#{shared_path}/config/database.yml"
      upload! "config/secrets.yml.key", "#{shared_path}/config/secrets.yml.key"

      # Para usar unicorn
      # upload! "config/unicorn_init.sh", "#{shared_path}/config/unicorn_init.sh"
      # upload! "config/unicorn.rb", "#{shared_path}/config/unicorn.rb"
      # sudo "ln -nfs #{shared_path}/config/unicorn_init.sh /etc/init.d/unicorn/#{fetch(:application)}"
      # sudo "ln -nfs /etc/init.d/unicorn/#{fetch(:application)} /etc/init.d/unicorn_#{fetch(:application)}"


      invoke :'deploy:check:linked_dirs'
      upload! "public/shared", "#{shared_path}/public", recursive: true
      invoke :'puma:config'
      invoke :'puma:nginx_config'
      sudo "service nginx restart"
      # puts "Ahora editá la configuración de la base de datos en #{shared_path}."
    end
  end
end
