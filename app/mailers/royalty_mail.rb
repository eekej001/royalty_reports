#class RoyaltyMail < ApplicationMailer
class RoyaltyMail < ActionMailer::Base
   default from: "mangatestemail@gmail.com"

 # def sample_email(email)
  def sample_email(titles)
   # @email = email
   # mail(to: @email, subject: 'Sample Email')
    #attachments['royalty_report.xlsx'] = File.read('path/to/file.pdf')
    @titles = Artist.find(1).titles
    @email = 'ebenezer@emanga.com'
    @customers = Order.all
    #xlsx = render handlers: [:axlsx], template: 'proxy/index', layout: false, locals: {customers: @customers}
    xlsx = render handlers: [:axlsx], template: 'proxy/index', layout: false, locals: {titles: @titles}
    attachments['report.xls'] = {mime_type: Mime::XLSX, content: xlsx }
	mail :to => @email,
         :body => 'test',
         :subject => 'Sample Report',
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
