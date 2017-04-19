# class TonanSearcher
#   attr_reader :params, :tonans
#   def call params
#     @params = params
#     @tonans = simple_search
#     self
#   end
#
#   def simple_search
#     Tonan.search do
#     fulltext params[:q]
#     paginate(:page => params[:page], :per_page => 7)
#     end.results
#   end
#
# end
