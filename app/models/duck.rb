class Duck < ApplicationRecord
    validates_presence_of :name, :description

    belongs_to :student

    def student_attributes=(student_attrs)
        student = Student.find_or_create_by(name: student_attrs[:name], mod: student_attrs[:mod])
        self.update(student: student)
    end
end
