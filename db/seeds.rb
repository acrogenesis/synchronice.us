# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

weekdays = [
  {:name=>"Lunes"},
  {:name=>"Martes"},
  {:name=>"Miercoles"},
  {:name=>"Jueves"},
  {:name=>"Viernes"},
  {:name=>"Sabado"},
  {:name=>"Domingo"}
]

weekdays.each do |day|
  Weekday.create do |w|
    w.name = day[:name]
  end
end

a = (1..168).to_a
daynumber = 1
a.each_with_index do |timeblock, index|
  if(index>23)
    if(a[index-1]%24==0)
      daynumber = daynumber+1
    end
   end
  puts "#{a[index]} #{daynumber}\n"  
  Event.create do |e|
    e.weekday_id = daynumber
  end
end
