# this file shows constant time using seek
# random access
# seek and read operate on bytes, NOT characters, so !! w/ multibyte char encoding

def get_week(file, week)
  file.seek((week - 1) * 63)

  week = {
    date:  file.read(10).strip,
    temps: {}
  }

  [:nino12, :nino3, :nino34, :nino4].each do |region|
    week[:temps][region] = {
      temp:   file.read(9).to_f,
      change: file.read(4).to_f
    }
  end

  week
end

File.open("data/wksst8110.for") do |file|
  get_week(file, 3)
#   irb(main):019:0> get_week(file, 3)
# {
#      :date => "17JAN1990",
#     :temps => {
#         :nino12 => {
#               :temp => 24.2,
#             :change => -0.3
#         },
#          :nino3 => {
#               :temp => 25.3,
#             :change => -0.3
#         },
#         :nino34 => {
#               :temp => 26.5,
#             :change => -0.1
#         },
#          :nino4 => {
#               :temp => 28.6,
#             :change => 0.3
#         }
#     }
# }
  get_week(file, 303) #...
  get_week(file, 1303)
#   irb(main):021:0> get_week(file, 1303)
# {
#      :date => "17DEC2014",
#     :temps => {
#         :nino12 => {
#               :temp => 22.9,
#             :change => 0.1
#         },
#          :nino3 => {
#               :temp => 26.0,
#             :change => 0.8
#         },
#         :nino34 => {
#               :temp => 27.4,
#             :change => 0.8
#         },
#          :nino4 => {
#               :temp => 29.4,
#             :change => 1.0
#         }
#     }
# }
end
