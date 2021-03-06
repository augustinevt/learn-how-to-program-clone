class Lesson < ActiveRecord::Base
  belongs_to :course
  has_many :sections

  def next
    new_lesson = Lesson.find_by(number: self.number + 1, course_id: self.course_id)
    if new_lesson
       new_lesson
    else
       nil
    end
  end

  def previous
    new_lesson = Lesson.find_by(number: self.number - 1, course_id: self.course_id)
    if new_lesson
      new_lesson
    else
      nil
    end
  end
end
