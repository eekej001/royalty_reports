#class RoyaltyMail < ApplicationMailer
class RoyaltyMail < ActionMailer::Base
   default from: "mangatestemail@gmail.com"

 # def sample_email(email)
  def royalty_report(artist_index)
   # @email = email
   # mail(to: @email, subject: 'Sample Email')
    #attachments['royalty_report.xlsx'] = File.read('path/to/file.pdf')
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
         :body => "Hello #{@artist_e_name},\n\nYou will find the royalty report for #{prev_date} through #{current_date} attached to this email.\n\nRegards,\nDigital Manga",
         :subject => "Royalty Report #{prev_date} - #{current_date}",
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
