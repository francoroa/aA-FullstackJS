class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |h, k| h[k] = []}
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(string)
    @teachers << string
  end

  def enroll(string)
    if @students.length < @student_capacity 
        @students << string
        return true
    end
    false
  end

  def enrolled?(string)
    if @students.include? string
        return true
    end
    false
  end

  def student_to_teacher_ratio
    @students.length / @teachers.length
  end

  def add_grade(string, number)
    if enrolled? string 
        @grades[string] << number
        return true
    end
    false
  end

  def num_grades(string)
    @grades[string].length
  end

  def average_grade(string)
    if !enrolled? string or @grades[string].length == 0
        return nil
    else 
        @grades[string].sum / @grades[string].length
    end
  end
end
