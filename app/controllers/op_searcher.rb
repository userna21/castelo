class OpSearcher
  attr_reader :params, :oploverzs
  def call params
    @params = params
    @oploverzs = simple_search
    self
  end

  def simple_search
    Oploverz.search do
      fulltext params[:q]
      paginate(:page => params[:page], :per_page => 7)
  end.results
end

end
