# class MeloSearcher
#   attr_reader :params, :melodies
#   def call params
#     @params = params
#     @melodies = simple_search
#     self
#   end
#
#   def simple_search
#     Melody.search do
#     fulltext params[:q]
#     paginate(:page => params[:page], :per_page => 7)
#     end.results
#   end
#
# end
