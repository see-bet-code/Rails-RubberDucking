class Student < ApplicationRecord
    validates_presence_of :name
    validates :mod, inclusion: (1..5)

    has_many :ducks

    def duck_attributes=(duck_attrs)
        duck = Duck.find_or_create_by(name: duck_attrs[:name], description: duck_attrs[:description])
        self.ducks << duck
    end
end
