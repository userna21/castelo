class SameSearcher
  attr_reader :params, :sames
  def call params
    @params = params
    @sames = simple_search
    self
  end

  def simple_search
    Same.search do
    fulltext params[:q]
    paginate(:page => params[:page], :per_page => 7)
    end.results
  end

end
