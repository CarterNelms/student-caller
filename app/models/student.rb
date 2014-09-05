class Student < ActiveRecord::Base
  def name
    "#{first_name} #{last_name}"
  end

  def sorting_name
    (self.last_name + self.first_name).downcase
  end

  # def last_time_called
  #   last_time_called = 'Never'
  #   if self.called_at != Time.new(0)
  #     now = Time.now
  #     time_passed = now - self.called_at
  #     day = 24 * 60 * 60
  #     hour = 60 * 60
  #     minute = 60
  #     second = 1
  #     if time_passed > day
  #       last_time_called = "#{(time_passed/day).round} days ago"
  #     elsif time_passed > hour
  #       last_time_called = "#{(time_passed/hour).round} hours ago"
  #     elsif time_passed > minute
  #       last_time_called = "#{(time_passed/minute).round} minutes ago"
  #     else
  #       last_time_called = "#{(time_passed/second).round} seconds ago"
  #     end
  #     # last_time_called = time_ago_in_words(Time.now - 3.hours)
  #   end
  #   last_time_called
  # end

  def pickable?
    !self.called_at.today?
  end

  def pick
    self.called_at = Time.now
    self.save!
  end

  def self.pick
    student = nil
    # pickable_students = Student.all.select{|s| s.pickable?}
    pickable_students = Student.where("called_at < ?", Date.today)
    if pickable_students.length > 0
      student = pickable_students.sample
      student.pick
    end
    student
  end
end
