module Task1
  class << self
    def min_time_difference(times)
      minutes = convert_to_minutes(times).sort

      deltas = minutes.each_with_index.map do |t2, index|
        t1 = minutes[index - 1]
        next 1440 - t1 + t2 if index.zero?

        t2 - t1
      end

      deltas.min
    end

    private

    def convert_to_minutes(times)
      times.map { |time| time.split(':')[0].to_i * 60 + time.split(':')[1].to_i + (time.include?('am') ? 0 : 720) }
    end
  end
end

p Task1.min_time_difference(%w[2:10pm 1:30pm 10:30am 4:42pm]) == 40
p Task1.min_time_difference(%w[2:10pm 2:30pm 0:10am 11:55pm]) == 15
