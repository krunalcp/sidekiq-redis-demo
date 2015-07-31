class HomeController < ApplicationController
  def index
  end
  
  def start_task
    $redis.set('task', "start")
    
    # Added a new Job to Sidekiq Queue
    JobWorker.perform_async
  end

  def client1
    $redis.set("phase1", "start")
  end

  def client2
    $redis.set("phase2", "start")
  end
end
