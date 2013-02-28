Delayed::Worker.delay_jobs = !Rails.env.test?
Delayed::Worker.max_run_time = 5.minutes
Delayed::Worker.max_attempts = 1
