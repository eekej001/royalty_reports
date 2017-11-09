#class RoyaltyMail < ApplicationMailer
class RoyaltyMail < ActionMailer::Base
   default from: "mangatestemail@gmail.com"

 # def sample_email(email)
  #def royalty_report(artist_index)
  def royalty_report(id)
   # @email = email
   # mail(to: @email, subject: 'Sample Email')
    #attachments['royalty_report.xlsx'] = File.read('path/to/file.pdf')
=begin
    artist = Artist.find(artist_index + 1)
    @titles = artist.titles
    email = artist.email
    @artist_e_name = artist.e_name
    @artist_j_name = artist.j_name

    

    current_date = Time.now.to_s
	current_date = DateTime.parse(current_date).strftime("%m/%Y")
	prev_date = DateTime.parse(current_date) << 3
	prev_date = DateTime.parse(prev_date.to_s).strftime("%m/%Y")

    #@email = 'ebenezer@emanga.com'
    #@customers = Order.all
    #xlsx = render handlers: [:axlsx], template: 'proxy/index', layout: false, locals: {customers: @customers}
    xlsx = render handlers: [:axlsx], template: 'proxy/index', layout: false, locals: {titles: @titles}
    attachments['report.xls'] = {mime_type: Mime::XLSX, content: xlsx }
	mail :to => email,
	     :cc => "ebenezer@emanga.com",
         :body => "#{@artist_j_name}様, お世話になっております、\n\n#{prev_date}~#{current_date}の印税レポートを添付いたしましたので、宜しくご査収及びご確認下さい。\n\n宜しくお願い致します。\nDigital Manga",
         :subject => "印税レポート #{prev_date} - #{current_date}",
         :template_path => 'proxy',
         :template_name => 'index'


=end
    artist = Artist.find(id)
    @titles = artist.titles
    email = artist.email
    @artist_e_name = artist.e_name
    @artist_j_name = artist.j_name

    #CHANGE TO START DATE AND END DATE

    #end_date = Time.now.to_s
    end_date_init = Date.yesterday.end_of_day.to_s
	end_date = DateTime.parse(end_date_init).strftime("%m/%d/%Y")
	start_date_init = DateTime.parse(end_date_init) << artist.r_frequency
	start_date = DateTime.parse(start_date_init.to_s).strftime("%m/%d/%Y")

    #@email = 'ebenezer@emanga.com'
    #@customers = Order.all
    #xlsx = render handlers: [:axlsx], template: 'proxy/index', layout: false, locals: {customers: @customers}
    xlsx = render handlers: [:axlsx], template: 'proxy/index', layout: false, locals: {titles: @titles}
    attachments['report.xls'] = {mime_type: Mime::XLSX, content: xlsx }
	mail :to => email,
	     :cc => "ebenezer@emanga.com",
         :body => "#{@artist_j_name}様, お世話になっております、\n\n#{start_date}~#{end_date}の印税レポートを添付いたしましたので、宜しくご査収及びご確認下さい。\n\n宜しくお願い致します。\nDigital Manga",
         :subject => "印税レポート #{start_date} - #{end_date}",
         :template_path => 'proxy',
         :template_name => 'index'
    
  end
  

=begin
  private

  def save_xlsx(report)
    av = ActionView::Base.new
    av.view_paths = ActionController::Base.view_paths
    av.assign report: report
    av.render handlers: [:axlsx], template: '/royalty_mail/test_report'
  end
=end
end
