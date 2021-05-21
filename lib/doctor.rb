class Doctor
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select do |appointment|
            appointment.doctor == self
        end
    end

    def patients
        ret = []
        appointments.each do |appointment|
            if !ret.include?(appointment.patient)
                ret << appointment.patient
            end
        end
        ret
    end

    def new_appointment(date, patient)
        appt = Appointment.new(date, patient, self)
    end
end
