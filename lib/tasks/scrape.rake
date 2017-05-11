namespace :scrape do
   desc "Get oploverz data"
   task oploverz: :environment do

     require 'nokogiri'
     require 'open-uri'
     require 'rinku'
     require 'rails_autolink'

     urltext = 'http://oploverz.in/'

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

     oploverzs = []
     ostreams = []

     links.each do |link|
       begin
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

       st = page.css('div.epsc')
       st1 = st.css('div.soradrive')
       st2 = st1.css('div.drv')
       st3 = st2.css('div#embed.video-1')
       st4 = st3.css('div.embedholder')
       st5 = st4.css('video')
       st5.css('source').each do |stream|
         ostreams << stream.attr(:src)
       end

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

     rescue => e
       e.message
     end

       oploverzs << { title: titles, sinops: sinops, small: smalls, medium: mediums }

     end

     oploverzs.each do |oploverz|
       begin
       @oploverz = Oploverz.new
       @oploverz.title = oploverz[:title]
       @oploverz.sinops = oploverz[:sinops]
       @oploverz.small = oploverz[:small].join(" | ")
       @oploverz.medium = oploverz[:medium].join(" | ")

     rescue => e
       e.message
     end
       @oploverz.save

       oimages.each do |oimage|
         begin
         @oimage = Oimage.new
         @oimage.url = oimage[0]
         @oimage.oploverz_id = @oploverz.id

       rescue => e
         e.message
       end
         @oimage.save

         ostreams.each do |ostream|
           begin
           @ostream = Ostream.new
           @ostream.link = ostream
           @ostream.oploverz_id = @oploverz.id
         rescue => e
           e.message
         end
           @ostream.save
         end
       end
     end
   end

   desc "Delete oploverz data"
   task destroy_all: :environment do
     Oploverz.destroy_all
   end

   desc "Get Awsubs Data"
   task awsubs: :environment do
     require 'nokogiri'
     require 'open-uri'
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
       ali6 = ali5.css('a[href]').each do |line|         links << line.attr(:href)
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
       begin
       page = Nokogiri::HTML(open(link))
       pg = page.css('div#venkonten')
       pg1 = pg.css('div.vezone')
       pg2 = pg1.css('div.venser')
       pg3 = pg2.css('div.venutama')
       pg4 = pg3.css('div.jdlr')
       mtitles = pg4.css('h1').text
       pg5 = pg3.css('div.lexot')
       msinops = pg5.css('p')[0].text

       dstreams = []
       mstr = pg3.css('div#pembed.player-embed')
       mstr.css('iframe[src]').each do |stream|
         dstreams << stream.attr(:src)
       end

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

     rescue => e
       e.message
     end

     melodys << {
       mtitle: mtitles,
       msinop: msinops,
       msmall: msmalls,
       mmedium: mmediums,
       dstream: dstreams
     }
     end

     melodys.each do |melody|
       begin
       @melody = Melody.new
       @melody.mtitle = melody[:mtitle]
       @melody.msinop = melody[:msinop]
       @melody.msmall = melody[:msmall].join(" || ")
       @melody.mmedium = melody[:mmedium].join(" || ")
       @melody.dstream = melody[:dstream]

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
   task destroy_melody: :environment do
     Melody.destroy_all
   end

   desc "Get Tonan Data"
   task tonan: :environment do

     require "nokogiri"
     require "open-uri"
     require 'rinku'
     require 'rails_autolink'

     url = 'http://tontonanime.com/'

     links = []


     page = Nokogiri::HTML(open(url))
     t1 = page.css('div.wrap')
     t2 = t1.css('div#item-1.item')
     t3 = t2.css('div.row.room-list')
     t4 = t3.css('div.col-sm-4')
     t5 = t4.css('div.room-thumb')
     t6 = t5.css('div.mask')
     t7 = t6.css('div.main')
     t8 = t7.css('h5 a[href]').each do |line|
       links << url+line.attr(:href)
     end

     timages = []
     t5.css('img.img-responsive').each do |image|
       timages << url+image.attr(:src)
     end

     tonans = []

     links.each do |link|
       begin
       pages = Nokogiri::HTML(open(link))
       tt = pages.css('div.col-md-8')
       tt1 = tt.css('article')
       tt2 = tt1.css('div.row')
       tt3 = tt2.css('div.col-md-12')
       tt4 = tt3.css('h3.lined-heading')
       ttitles = tt4.css('span').text
       ss1 = tt3.css('div.row')
       ss2 = ss1.css('div.col-md-12')
       ss3 = ss2.css('center')
       ss4 = ss3.css('div.comment')
       tsinops = ss4.css('p')[1].text

       tsmalls = []
       tsm = ss3.css('p')[4]
       tsm.css('a[href]')[0..3].each do |small|
         tsmalls << small.attr(:href)
       end

       tmediums = []
       tmd = ss3.css('p').last
       tmd.css('a[href]')[0..3].each do |medium|
         tmediums << medium.attr(:href)
       end

     rescue => e
       e.message
     end

     tonans << {
       title: ttitles,
       sinop: tsinops,
       small: tsmalls,
       medium: tmediums
     }
     end

     tonans.each do |tonan|
       begin
       @tonan = Tonan.new
       @tonan.title = tonan[:title]
       @tonan.sinop = tonan[:sinop]
       @tonan.small = tonan[:small].join(" || ")
       @tonan.medium = tonan[:medium].join(" || ")

     rescue => e
       e.message
     end
       @tonan.save

     timages.each do |timage|
       begin
         @timage = Timage.new
         @timage.url = timage
         @timage.tonan_id = @tonan.id

       rescue => e
         e.message
       end
         @timage.save
       end
     end
   end

   desc "Delete Tonan Data"
   task destroy_tonan: :environment do
     Tonan.destroy_all
   end

   desc "Get Same Data"
   task same: :environment do

     require "nokogiri"
     require "open-uri"
     require 'rinku'
     require 'rails_autolink'

     url = 'https://www.samehadaku.net/'

     links = []

     page = Nokogiri::HTML(open(url))
     same = page.css('#main-content')
     sm1 = same.css('article')
     sm2 = sm1.css('div.mh-posts-list-content.clearfix')
     sm3 = sm2.css('header.mh-posts-list-header')
     sm4 = sm3.css('h3.entry-title.mh-posts-list-title')
     stitle = sm4.css('a').text
       sm4.css('a[href]').each do |line|
         links << line.attr(:href)
       end

     limages = []
     limg = sm1.css('figure.mh-posts-list-thumb')
     limg.css('img.attachment-mh-magazine-medium.size-mh-magazine-medium.wp-post-image').each do |limage|
       limages << limage.attr("src")
     end

     sames = []

     links.each do |link|
       begin
         sml = Nokogiri::HTML(open(link))
         id = sml.css('div#main-content.mh-content')
         smt = id.css('header.entry-header.clearfix')
         smtitle = smt.css('h1.entry-title').text
         sino = id.css('div.entry-content.clearfix')

         lsmall1 = []
         sdl1 = sino.css('div.download-eps')[0]
         sdl2 = sdl1.css('ul li')[1]
         sdl2.css('a[href]')[0..6].each do |small1|
           lsmall1 << small1.attr(:href)
         end

         lsmall2 = []
         sdl = sino.css('div.download-eps')[0]
         sdl3 = sdl.css('ul')
         sdl4 = sdl3.css('li')[2]
         sdl4.css('a[href]')[0..6].each do |small2|
           lsmall2 << small2.attr(:href)
         end

         lmedium1 = []
         mdl1 = sino.css('div.download-eps')[1]
         mdl2 = mdl1.css('ul')
         mdl5 = mdl2.css('li')[1]
         mdl5.css('a')[0..6].each do |medium1|
           lmedium1 << medium1.attr(:href)
         end

         lmedium2 = []
         mdl = sino.css('div.download-eps')[1]
         mdl3 = mdl.css('ul li')[2]
         mdl3.css('a[href]')[0..6].each do |medium2|
           lmedium2 << medium2.attr(:href)
         end

       rescue => e
         e.message
       end

       sames << {
         title: smtitle,
         lsmall1: lsmall1,
         lsmall2: lsmall2,
         lmedium1: lmedium1,
         lmedium2: lmedium2
       }
       end

       sames.each do |same|
         begin
         @same = Same.new
         @same.title = same[:title]
         @same.lsmall1 = same[:lsmall1].join(" || ")
         @same.lsmall2 = same[:lsmall2].join(" || ")
         @same.lmedium1 = same[:lmedium1].join(" || ")
         @same.lmedium2 = same[:lmedium2].join(" || ")

       rescue => e
         e.message
       end
         @same.save

         limages.each do |limage|
           begin
           @limage = Limage.new
           @limage.url = limage
           @limage.same_id = @same.id

         rescue => e
           e.message
         end
           @limage.save
         end
       end
   end

   desc "Delete Same Data"
   task destroy_same: :environment do
     Same.destroy_all
   end

   desc "Get movieu data"
   task movieu: :environment do

     require 'nokogiri'
     require "open-uri"
     # require "byebug"

     url = 'http://www.movieu.net/'

     links = []

     page = Nokogiri::HTML(open(url))
     mov = page.css('div#content')
     mov4 = mov.css('section#blog-grid')
     mov5 = mov4.css('div.blog-grid-container.sidebars_1')
     mov6 = mov5.css('div.blog-grid-items.clearfix.post-box-wrapper')
     mov7 = mov6.css('div.content_wrapper')
     mov8 = mov7.css('header.entry-header')
     mov9 = mov8.css('h2.entry-title')
     mov9.css('a[href]').each do |link|
       links << link.attr(:href)
     end

     movieus = []
     vimages = []

     links.each do |link|
        begin
       pages = Nokogiri::HTML(open(link))
       mt = pages.css('div.entry-header-wrapper')
       mt1 = mt.css('header.entry-header')
       titles = mt1.css('h1.entry-title').text

       mimg = pages.css('div.clearfix')
       moimg = mimg.css('p')
       moimg.css('img').each do |image|
         vimages << image.attr(:src)
       end

       mostreams = []
       mst4 = pages.css('div.arve-embed-container')
       mst4.css('iframe.arve-iframe.fitvidsignore')[0..3].each do |mstream|
         mostreams << mstream.attr(:src)
       end

     rescue => e
       e.message
     end

     movieus << {
       title: titles,
       gstream: mostreams[0],
       nstream: mostreams[1],
       lstream: mostreams[2],
       mstream: mostreams[3]
     }
     end

     movieus.each do |movieu|
       begin
       @movieu = Movieu.new
       @movieu.title = movieu[:title]
       @movieu.gstream = movieu[:gstream]
       @movieu.nstream = movieu[:nstream]
       @movieu.lstream = movieu[:lstream]
       @movieu.mstream = movieu[:mstream]

     rescue => e
       e.message
     end
       @movieu.save

       vimages.each do |vimage|
         begin
         @vimage = Vimage.new
         @vimage.url = vimage
         @vimage.movieu_id = @movieu.id

       rescue => e
         e.message
       end
         @vimage.save
       end
     end
   end

   desc "Delete movieu Data"
   task destroy_movieu: :environment do
     Movieu.destroy_all
   end

 end
