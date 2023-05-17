class CrawlersController < ApplicationController
  before_action :set_crawler, only: [:show, :edit, :update, :destroy]

  def index
    @crawlers = Crawler.all.order(:keywords)
  end

  def show
  end

  def new
    @crawler = Crawler.new
  end

  def create
    puts params.inspect
    @crawler = Crawler.new(crawler_params)

    if @crawler.save
      redirect_to crawlers_path, notice: "Crawler was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @crawler.update(crawler_params)
      redirect_to crawlers_path, notice: "Crawler was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @crawler.destroy
    redirect_to crawlers_path, notice: "Crawler was successfully destroyed."
  end

  private

  def set_crawler
    @crawler = Crawler.find(params[:id])
  end

  def crawler_params
    crawler = params.require(:crawler).permit(:keywords, driver_ids: [] )
    crawler
  end
end
