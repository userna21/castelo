namespace :scrape do
  desc "Get all data"
  task oploverz: :environment do

    require 'nokogiri'
    require 'open-uri'
    require 'rinku'
    require 'rails_autolink'


    urltext = 'http://oploverz.in/page/1'

    links = []
    oimages = []

    # (1..2).each do |i|
      page = Nokogiri::HTML(open(urltext))
      i = page.css('div#content')
      i1 = i.css('div.boxed')
      i2 = i1.css('div.right')
      i3 = i2.css('div.lts')
      i4 = i3.css('ul')
      i5 = i4.css('li')
      i6 = i5.css('div.thumb')
      i7 = i6.css('a')
      page.css('.dtl h2 a[href]').each do |line|
        links << line.attr(:href)
      end

      img = i7.css('img').each do |image|
        oimages << image.attr("src").split
      end

    # end


    oploverzs = []

    links.each do |link|

      page = Nokogiri::HTML(open(link))
      info = page.css('div#content')
      info1 = info.css('div#op-single-post.postbody')
      info2 = info1.css('div.epsc')
      info3 = info2.css('div.boxed')
      info4 = info3.css('div.right')
      info5 = info4.css('div.lts ul li')
      info6 = info5.css('div div.dtl')
      titles = info6.css('h1.title').text.strip
      sinfo = info1.css('div.animeinfo')
      sinfo1 = sinfo.css('div.sinop')
      sinops = sinfo1.css('p').text.strip

      smalls = []
      dowloada = info2.css('div.soraddl.op-download')[0]
      list_1 = dowloada.css('div.soraurl.list-download')[0]
      list_2 = list_1.css('span strong a[href]')[0..4].each do |small|
        smalls << small.attr(:href).strip.split(/ | /)
      end

      mediums = []
      dowloadi = info2.css('div.soraddl.op-download')[0]
      lista = dowloadi.css('div.soraurl.list-download')[1]
      linkb = lista.css('span strong a')[0..5].each do |medium|
        mediums << medium.attr(:href).strip.split(/ | /)
      end

      oploverzs << { title: titles, sinops: sinops, small: smalls, medium: mediums }

    end

    oploverzs.each do |oploverz|
      @oploverz = Oploverz.new
      @oploverz.title = oploverz[:title]
      @oploverz.sinops = oploverz[:sinops]
      @oploverz.small = oploverz[:small].join(" | ")
      @oploverz.medium = oploverz[:medium].join(" | ")

      @oploverz.save

      oimages.each do |oimage|
        @oimage = Oimage.new
        @oimage.url = oimage[0]
        @oimage.oploverz_id = @oploverz.id

        @oimage.save
      end
    end
  end

  desc "Delete all data"
  task destroy_all: :environment do
    Oploverz.destroy_all
  end

  desc "Get Awsubs Data"
  task awsubs: :environment do
    require 'nokogiri'
    require 'open-uri'
    require 'byebug'
    require 'rinku'
    require 'rails_autolink'

    urltext = 'http://awsubs.co/'

    links = []
    aimages = []

      page = Nokogiri::HTML(open(urltext))
      ali = page.css('div.postsbody')
      ali1 = ali.css('div.reaz')
      ali2 = ali1.css('div.featured')
      ali3 = ali2.css('div[style="padding:1px 0;"]')
      ali4 = ali3.css('div.aztanime')
      ali5 = ali4.css('div.thumbnail')
      ali6 = ali5.css('a[href]').each do |line|
        links << line.attr(:href)
      end

    awsubs = []
    aimages = []

    links.each do |link|
      begin
      page = Nokogiri::HTML(open(link))
      css1 = page.css('div#content')
      css2 = css1.css('div.postsbody')
      css3 = css2.css('div.reaz')
      css4 = css3.css('div.featured2')
      css5 = css4.css('div[style="padding:0px;"]')
      css6 = css5.css('div.fpost')
      atitles = css4.css('h1').text
      css7 = css6.css('div')
      css0 = css7.css('div')[2]
      asinops = css0.css('p')[0].text

      aimg = css6.css('div')[3]
      aiim = aimg.css('div.separator')
      aimgs = aiim.css('a')
      img = aimgs.css('img').each do |image|
        aimages << image.attr(:src)
      end

      asmalls = []
      cssb = css7.css('div.dl-box')
      cssc = cssb.css('div.dl-item')
      cssc.css('a[href]')[0..6].each do |awsmall|
          asmalls << awsmall.attr(:href)
      end

      amediums = []
      awl = css7.css('div.dl-box')
      awli = awl.css('div.dl-item')
      awl.css('a[href]')[7..13].each do |awmedium|
          amediums << awmedium.attr(:href)
      end

    rescue => e
    e.message
    end

      awsubs << {
        title: atitles,
        sinop: asinops,
        asmall: asmalls,
        amedium: amediums
      }

    end

    awsubs.each do |awsub|
      begin
      @awsub = Awsub.new
      @awsub.title = awsub[:title]
      @awsub.sinop = awsub[:sinop]
      @awsub.asmall = awsub[:asmall].join(" || ")
      @awsub.amedium = awsub[:amedium].join(" || ")

    rescue => e
      e.message
    end
      @awsub.save

      aimages.each do |aimage|
        begin
          @aimage = Aimage.new
          @aimage.url = aimage
          @aimage.awsub_id = @awsub.id

        rescue => e
          e.message
        end
          @aimage.save
        end
    end
  end

  desc "Delete Awsubs Data"
  task destroy_awsubs: :environment do
    Awsub.destroy_all
  end

  desc "Get Melody Data"
  task melody: :environment do
    require "nokogiri"
    require "open-uri"
    require "byebug"
    require 'rinku'
    require 'rails_autolink'

    url = 'http://melodysubs.net/'

    links = []

    page = Nokogiri::HTML(open(url))
    mel = page.css('div.rapi')
    mel1 = mel.css('div.venz')
    mel2 = mel1.css('ul li')
    mel3 = mel2.css('div.detpost')
    mel4 = mel3.css('div.thumb')
    mel4.css('a[href]').each do |line|
      links << line.attr(:href)
    end

    melodys = []
    mimages = []


    links.each do |link|

      page = Nokogiri::HTML(open(link))
      pg = page.css('div#venkonten')
      pg1 = pg.css('div.vezone')
      pg2 = pg1.css('div.venser')
      pg3 = pg2.css('div.venutama')
      pg4 = pg3.css('div.jdlr')
      mtitles = pg4.css('h1').text
      pg5 = pg3.css('div.lexot')
      msinops = pg5.css('p')[0].text

      mlimg = pg5.css('div.thm')
      mlimg.css('img').each do |image|
        mimages << image.attr(:src)
      end

      mmediums = []
      mli = pg3.css('div.dlbod')
      mli1 = mli.css('div.liner')[0]
      mli2 = mli1.css('div.listlink')
      mli2.css('p a[href]')[0..3].each do |medium|
        mmediums << medium.attr(:href)
      end

      msmalls = []
      ml1 = mli.css('div.liner')[1]
      ml2 = ml1.css('div.listlink')
      ml2.css('p a[href]')[0..3].each do |small|
        msmalls << small.attr(:href)
      end

    melodys << {
      mtitle: mtitles,
      msinop: msinops,
      msmall: msmalls,
      mmedium: mmediums
    }
    end

    melodys.each do |melody|
        begin
        @melody = Melody.new
        @melody.mtitle = melody[:mtitle]
        @melody.msinop = melody[:msinop]
        @melody.msmall = melody[:msmall].join(" || ")
        @melody.mmedium = melody[:mmedium].join(" || ")

      rescue => e
        e.message
      end
        @melody.save

        mimages.each do |mimage|
          begin
            @mimage = Mimage.new
            @mimage.url = mimage
            @mimage.melody_id = @melody.id

          rescue => e
            e.message
          end
            @mimage.save
          end

      end
  end


  desc "Delete Melody Data"
  task destroy_melodoy: :environment do
    Melody.destroy_all
  end


end
