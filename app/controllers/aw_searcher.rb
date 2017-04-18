class AwSearcher
  attr_reader :params, :awsubs
  def call params
    @params = params
    @awsubs = simple_search
    self
  end

  def simple_search
    Awsub.search do
    fulltext params[:q]
    paginate(:page => params[:page], :per_page => 7)
    end.results
  end

end
