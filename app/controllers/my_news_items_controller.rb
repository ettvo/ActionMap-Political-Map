# frozen_string_literal: true

class MyNewsItemsController < SessionController
  before_action :set_representative
  before_action :set_representatives_list
  before_action :set_news_item, only: %i[edit update destroy]
  # before_action :set_issue

  # it2, pt2
  def index
    @news_items = NewsItem.all
  end

  # for it2, pt2.3
  def search
    # (:news, :title, :description, :link, :representative_id, :issue)
    # top 5 articles isn't defined in spec, so best to go by either date of creation 
    # or alphabetical order
    # begin 
    #   @issue = params[:issue]
    # rescue ActiveRecord::RecordNotFound
    #   redirect_to representative_news_items_path(@representative), alert: 'News articles not found.'
    # end
    @issue = params[:issue]
    #TODO: query the News API and display top 5
    # News API key
    # Google::Apis::CivicinfoV2::CivicInfoService.new

    # service_key = Rails.application.credentials.dig(Rails.env.to_sym, :NEWS_API_KEY)
    service = News.new("9e9026fefdd44b9fa3552d224e2b9483")
    if service.nil?
      redirect_to representative_news_items_path(@representative), alert: 'Invalid API key.'
    end

    # @top_5_news_items = service.get_top_headlines(q: @representative.name, language: 'en', country: 'us')
    query = @representative.name + " " + @issue
    # all_articles = service.get_everything(q: query, language: 'en', country: 'us', pageSize: 5, sortBy: "popularity") 
    all_articles = service.get_everything(q: query, sortBy: "popularity") 
    arr = []
    all_articles.first(5).map do |article| 
      # arr << NewsItem.new(representative_id: @representative.ocdid, title: article.title, description: article.description, link: article.url, published_at: article.publishedAt, issue: @issue)
      arr << NewsItem.new(representative_id: @representative.ocdid, title: article.title, description: article.description, link: article.url, issue: @issue)
    end
    @top_5_news_items = arr
    # :news, :title, :description, :link, :representative_id, :issue

    # @top_5_news_items = all_articles.articles.first(5).map do |article| { title: article.title, description: article.description, link: article.url, published_at: article.publishedAt } end
    # @top_5_news_items = service
    # limit by size to 5
    # https://github.com/olegmikhnovich/News-API-ruby
    # https://newsapi.org/docs/client-libraries/ruby

    # begin
    #   result = service.representative_info_by_address(address: @address)
    #   @representatives = Representative.civic_api_to_representative_params(result)
    # rescue Google::Apis::Error => e
    #   flash[:error] = "Error searching for representatives: #{e.message}"
    #   redirect_to root_path and return
    # end


    # begin
    #   result = service.representative_info_by_address(address: address)
    #   @representatives = Representative.civic_api_to_representative_params(result)
    #   render 'search'
    # rescue Google::Apis::Error => e
    #   flash[:error] = "Error searching for representatives: #{e.message}"
    #   redirect_to representatives_path
    # end


    # @issue = params
    # begin 
    #   # top_5 = NewsItems.all.map { |r| [r.name, r.id] }
    #   @top_5_news_items = NewsItem.where(ocid: @representative.ocdid, issue: @issue).order('title desc').limit(5);
    # rescue ActiveRecord::RecordNotFound
    #   redirect_to root_url, alert: 'News articles not found.'
    # end
  end 

  # for it2, pt2.3
  def top_5; end 

  # for it2, pt2.3
  def save
    @news_item = params
    puts params
    @news_item.save!
    redirect_to representative_news_items_path(@representative)
  end 

  # given
  def new
    @news_item = NewsItem.new
  end

  def edit; end

  def create
    @news_item = NewsItem.new(news_item_params)
    if @news_item.save
      redirect_to representative_news_item_path(@representative, @news_item),
                  notice: 'News item was successfully created.'
    else
      render :new, error: 'An error occurred when creating the news item.'
    end
  end

  def update
    if @news_item.update(news_item_params)
      redirect_to representative_news_item_path(@representative, @news_item),
                  notice: 'News item was successfully updated.'
    else
      render :edit, error: 'An error occurred when updating the news item.'
    end
  end

  def destroy
    @news_item.destroy
    redirect_to representative_news_items_path(@representative),
                notice: 'News was successfully destroyed.'
  end

  private

  def set_representative
    @representative = Representative.find(
      params[:representative_id]
    )
  end

  def set_representatives_list
    @representatives_list = Representative.all.map { |r| [r.name, r.id] }
  end

  def set_news_item
    @news_item = NewsItem.find(params[:id])
  end

  # def set_issue
  #   @issue = params[:issue]
  # end

  # Only allow a list of trusted parameters through.
  def news_item_params
    params.require(:news_item).permit(:news, :title, :description, :link, :representative_id, :issue)
    # params.require(:news_item).permit(:news, :title, :description, :link, :representative_id)
  end
end
