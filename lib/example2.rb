
class Job
  attr_accessor :id, :deadline, :profit

  def initialize(id, deadline, profit)
    @id = id
    @deadline = deadline
    @profit = profit
  end
end


def min(num1, num2)
  return num1 < num2 ? num1 : num2
end

def print_job_scheduling(jobs, number_of_jobs)
  # sort jobs by most to least profit
  jobs = jobs.sort_by { |job| -job.profit }
  
  # To keep track of free time slots 
  slots = Array.new(number_of_jobs, false)

  # To store result (sequence of jobs to take)
  selected_jobs = Array.new(number_of_jobs, nil)

  jobs.each do |job|
    j = min(number_of_jobs, job.deadline) - 1

    while j >= 0

      if (slots[j] == false)
        selected_jobs[j] = job
        slots[j] = true
        break
      end
      j -= 1
    end
  end

  selected_jobs.each_with_index do |selected_job, index|
    if slots[index]
      puts "#{index + 1}: #{selected_job.id}"
    end
  end

end

job_array = [
  Job.new('a', 2, 100),
  Job.new('b', 1, 19),
  Job.new('c', 2, 27),
  Job.new('d', 1, 25),
  Job.new('e', 3, 15),
]


print_job_scheduling(job_array, 5)
