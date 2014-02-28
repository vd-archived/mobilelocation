root = "/home/vamika/apps/mobilelocation/current"
working_directory root
pid "#{root}/tmp/pids/unicorn_mobilelocation.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.mobilelocation.sock"
worker_processes 2
timeout 30
