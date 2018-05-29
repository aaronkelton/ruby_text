# I didn't get the same results as the author. 
File.open("data/wksst8110.for") do |file|
  weeks = []

  until file.eof?
    week = {
      date: file.read(10).strip,
      temps: {}
    }
    [:nino12, :nino3, :nino34, :nino4].each do |region|
      week[:temps][:region] = {
        temp: file.read(9).to_f,
        change: file.read(4).to_f
      }
    end

    file.read(1)
    weeks << week

  end

  weeks

end

# [
#     [   0] {
#          :date => "03JAN1990",
#         :temps => {
#             :region => {
#                   :temp => 28.6,
#                 :change => 0.3
#             }
#         }
#     },
#     [   1] {
#          :date => "10JAN1990",
#         :temps => {
#             :region => {
#                   :temp => 28.6,
#                 :change => 0.3
#             }
#         }
#     },
#     [   2] {
#          :date => "17JAN1990",
#         :temps => {
#             :region => {
#                   :temp => 28.6,
#                 :change => 0.3
#             }
#         }
#     }, #...
