class CrawlersController < ApplicationController
  before_action :set_crawler, only: [:show, :edit, :update, :destroy]

  def index
    @crawlers = Crawler.alphabetical_sync
  end

  def show
  end

  def new
    @crawler = Crawler.new
  end

  def create
    @crawler = current_user.crawlers.build(crawler_params)

    if @crawler.save

      respond_to do |format|
        format.html { redirect_to crawlers_path, notice: "Crawler was successfully created" }
        format.turbo_stream { flash.now[:notice] = "Crawler was successfully created" }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @crawler.update(crawler_params)
      respond_to do |format|
        format.html { redirect_to crawlers_path, notice: "Crawler was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Crawler was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @crawler.destroy
    respond_to do |format|
      format.html { redirect_to crawlers_path, notice: "Crawler was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Crawler was successfully destroyed." }
    end
  end

  private

  def set_crawler
    @crawler = Crawler.find(params[:id])
  end

  def crawler_params
    params.require(:crawler).permit(:keywords, driver_ids: [])
  end
end
