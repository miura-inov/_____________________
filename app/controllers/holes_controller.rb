class HolesController < ApplicationController
  before_action :set_hole, only: [:show, :edit, :update, :destroy]

  def check_link
    require 'net/http'
    # リンクチェック対象 URL
    require 'nokogiri'
    require 'open-uri'

    charset = nil

    def get_hole_url(path)
      h = open("http://papimo.jp" + path) do |f|
        f.read # htmlを読み込んで変数htmlに渡す
      end
      dc = Nokogiri::HTML.parse(h, nil, nil)
      dc.xpath('//*[@id="base_content"]/p/a')[0][:href]
    end

    47.times do |i|
      area_id = i + 1
      page_id = 1
      next_page_flg = true
      # s/13/page:1
      while next_page_flg
        url = "http://papimo.jp/hall/halls/#{area_id}/page:#{page_id}"
        p url
        html = open(url) do |f|
          f.read # htmlを読み込んで変数htmlに渡す
        end
        # htmlをパース(解析)してオブジェクトを生成
        doc = Nokogiri::HTML.parse(html, nil, charset)

        area_name = doc.xpath('//*[@id="base_content"]/h4').text
        hole_list = doc.xpath('//*[@id="base_content"]/div[@class="section"]')

        target_hole = hole_list.select do |hole|
          !hole.css('.oatari').empty?
        end

        target_hole.each do |t|
          new_hole = Hole.new
          new_hole.name = t.css('h5').text
          new_hole.url = get_hole_url(t.css('a')[0][:href])
          new_hole.area_id = area_id
          new_hole.save
        end

        if doc.css('.prev').length == 0 and doc.css('.next').length == 0
          next_page_flg = false
        elsif doc.css('.next_disable').length > 0
          next_page_flg = false
        else
          page_id += 1
        end
      end
    end
    raise
  end

  # GET /holes
  # GET /holes.json
  def index
    @holes = Hole.all
  end

  # GET /holes/1
  # GET /holes/1.json
  def show
  end

  # GET /holes/new
  def new
    @hole = Hole.new
  end

  # GET /holes/1/edit
  def edit
  end

  # POST /holes
  # POST /holes.json
  def create
    @hole = Hole.new(hole_params)

    respond_to do |format|
      if @hole.save
        format.html { redirect_to @hole, notice: 'Hole was successfully created.' }
        format.json { render :show, status: :created, location: @hole }
      else
        format.html { render :new }
        format.json { render json: @hole.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /holes/1
  # PATCH/PUT /holes/1.json
  def update
    respond_to do |format|
      if @hole.update(hole_params)
        format.html { redirect_to @hole, notice: 'Hole was successfully updated.' }
        format.json { render :show, status: :ok, location: @hole }
      else
        format.html { render :edit }
        format.json { render json: @hole.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /holes/1
  # DELETE /holes/1.json
  def destroy
    @hole.destroy
    respond_to do |format|
      format.html { redirect_to holes_url, notice: 'Hole was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hole
      @hole = Hole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hole_params
      params.require(:hole).permit(:name)
    end
end
