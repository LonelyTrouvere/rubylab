# var2

class Student
    attr_accessor :name, :needsDormitory, :exp, :isTeacher, :faculty, :spokenLanguage
  
    def initialize(name, dormitory, exp, isTeacher, faculty, spokenLanguage)
      @name = name
      @needsDormitory = dormitory
      @exp = exp
      @isTeacher = isTeacher
      @faculty = faculty
      @spokenLanguage = spokenLanguage
    end
end

def dormitory(students)
    studentsNeedingDormitory = students.count { |student| student.needsDormitory }
    puts "Number of students needing dormitory: #{studentsNeedingDormitory}"
    return studentsNeedingDormitory
end

def expiriencedTeacher(students)
    expiriencedTechers = students.count { |student| student.isTeacher && student.exp >= 2 }
    puts "Number of students that have 2 yers experience working as teacher: #{expiriencedTechers}"
    return expiriencedTechers
end

def pedSchool(students)
    pedSchoolGrad = students.count { |student| student.faculty == "Педучилище" }
    puts "Number of students who finished Pedagogical school: #{pedSchoolGrad}"
    return pedSchoolGrad
end

def languageGroups(students)
    languages = students.map { |student| student.spokenLanguage }.compact.uniq
    puts "Languages: "
    languages.each_with_index do |lang, index|
        puts "#{index+1}: #{lang}"
    end
    languages
end

students = Array.new(10) do |i|
    faculty = (i + 1) % 3 == 0 ? "Педучилище" : "Faculty#{(i % 3) + 1}"
    lang = (i+1) % 4 == 0 ? "English" : "Ukrainian" 
    Student.new("Student#{i + 1}", i.even?, i, i.odd?, faculty, lang)
end
  
  # Display information for each student in the array
  students.each_with_index do |student, index|
    puts "Student #{index + 1}:"
    puts "  Name: #{student.name}"
    puts "  Needs Dormitory: #{student.needsDormitory}"
    puts "  Experience: #{student.exp}"
    puts "  Is Teacher: #{student.isTeacher}"
    puts "  Faculty: #{student.faculty}"
    puts "  Spoken Language: #{student.spokenLanguage}"
    puts "---------------------"
  end

  dormitory(students)
  expiriencedTeacher(students)
  pedSchool(students)
  languageGroups(students)