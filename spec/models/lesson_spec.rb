describe Lesson do
  context '#next' do
    it 'returns the lesson with the  next-highest number than the current lesson' do
      current_lesson = Lesson.create({:name => 'lesson1', :number => 1})
      next_lesson = Lesson.create({:name => 'lesson2', :number => 2})
      expect(current_lesson.next).to eq next_lesson
    end
  end
  context '#next' do
    it 'returns the lesson with the  previous number to the current lesson' do
      current_lesson = Lesson.create({:name => 'lesson2', :number => 2})
      next_lesson = Lesson.create({:name => 'lesson1', :number => 1})
      expect(current_lesson.previous).to eq next_lesson
    end
  end
end
