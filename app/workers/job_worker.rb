class JobWorker
  include Sidekiq::Worker

  def perform
    if $redis.get('task') == "start"
      puts "Job Started"
      $redis.del('task')
      # Create your Watir Object here

      # Phase 1 job here
      i = 0
      while i < 30  # Max for 5 minutes
        if $redis.get("phase1") == "start"
          # Write your Phase 1 code here
          puts "Phase 1 Over"
          $redis.del("phase1")
          break;
        else
          sleep 5.seconds
          i += 1
        end
      end

      # Phase 2 job here
      i = 0
      while i < 30  # Max for 5 minutes
        if $redis.get("phase2") == "start"
          # Write your Phase 1 code here
          puts "Phase 2 Over"
          $redis.del("phase2")
          break;
        else
          sleep 5.seconds
          i += 1
        end
      end

      # Process is over here or you can add moer phase as per your requiement
      # Close your connection
      puts "Job ended"
    end
  end
end