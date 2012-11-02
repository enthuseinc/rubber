namespace :rubber do
  namespace :whenever do

    rubber.allow_optional_tasks(self)

    after "deploy:start", "rubber:whenever:update"
    after "deploy:stop",  "rubber:whenever:remove"

    desc "Update crontab with whenever schedule"
    task :update, :roles => :whenever do
      rsudo "cd #{current_path} && bundle exec whenever --write-crontab rubber-whenever"
    end

    desc "Remove whenever schedule from crontab"
    task :remove, :roles => :whenever do
      rsudo "cd #{current_path} && bundle exec whenever --clear-crontab rubber-whenever"
    end

  end
end
