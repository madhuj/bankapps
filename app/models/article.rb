class Article < ActiveRecord::Base
  has_many :comments
  validates :title,:text,:firstname,:lastname,:pincode,:phone,:country, presence:true
  
  
 









# scope :live_search, where("title LIKE ?", '%' + article_[:search].downcase + '%')

def self.search(search)
  if search
     self.where( "title LIKE ?", "#{search}%")
  else
    self.all
  end
end

end

