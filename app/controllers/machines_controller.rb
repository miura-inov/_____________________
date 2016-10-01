class MachinesController < ApplicationController
  before_action :set_machine, only: [:show, :edit, :update, :destroy]

  # GET /machines
  # GET /machines.json
  def index
    require 'open-uri'
    require 'nokogiri'

    # スクレイピング先のURL
    url = "http://papimo.jp/h/00031715/hit/index_sort/213110004/1-20-77338"
    charset = nil
    html = open(url) do |f|
      f.read # htmlを読み込んで変数htmlに渡す
    end
    # htmlをパース(解析)してオブジェクトを生成
    doc = Nokogiri::HTML.parse(html, nil, charset)

    ids = doc.css('#pjax-container .bottom_l .unit_no').map do |data|
      data.text.to_s
    end
    # スクレイピング先のURL
    show_url = "http://papimo.jp/h/00031715/hit/view/"
    charset = nil
    count = 0
    ids.each do |id|
      html = open(show_url + id) do |f|
        f.read # htmlを読み込んで変数htmlに渡す
      end
      # htmlをパース(解析)してオブジェクトを生成
      doc = Nokogiri::HTML.parse(html, nil, charset)

      doc.xpath('//*[@id="tab-data-some"]').each do |node|
      	datas = node.css('.data tbody tr')

      	day_data = datas[0].css('td')

      	if day_data[1].text == '-'
      		day_data = datas[1].css('td')
      	end

      	big = day_data[1].text
      	reg = day_data[2].text
      	art = day_data[3].text
      	total_num = day_data[6].text.remove(',')

        m = MachineResult.new
        m.machine_no = id
        m.played_games = total_num
        m.counter_a = big
        m.counter_b = reg
        m.counter_c = art
        m.save
        count = count + 1
      end
    end
    raise
    @machines = Machine.all
  end

  # GET /machines/1
  # GET /machines/1.json
  def show
  end

  # GET /machines/new
  def new
    @machine = Machine.new
  end

  # GET /machines/1/edit
  def edit
  end

  # POST /machines
  # POST /machines.json
  def create
    @machine = Machine.new(machine_params)

    respond_to do |format|
      if @machine.save
        format.html { redirect_to @machine, notice: 'Machine was successfully created.' }
        format.json { render :show, status: :created, location: @machine }
      else
        format.html { render :new }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /machines/1
  # PATCH/PUT /machines/1.json
  def update
    respond_to do |format|
      if @machine.update(machine_params)
        format.html { redirect_to @machine, notice: 'Machine was successfully updated.' }
        format.json { render :show, status: :ok, location: @machine }
      else
        format.html { render :edit }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /machines/1
  # DELETE /machines/1.json
  def destroy
    @machine.destroy
    respond_to do |format|
      format.html { redirect_to machines_url, notice: 'Machine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_machine
      @machine = Machine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def machine_params
      params.require(:machine).permit(:name)
    end
end
