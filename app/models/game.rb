class Game < ActiveRecord::Base
  attr_accessible  :title, :image_file_name, :category_ids, :image, :image_promo, :platform_ids, :short_text, :body, :keywords, :descriptions, :is_active, 
   :is_recomend, :is_best, :in_spec_block
 
  has_many :categories, :through => :category_relations
  has_many :category_relations, :dependent => :destroy
  
  has_many :platforms, :through => :platform_relations
  has_many :platform_relations, :dependent => :destroy
  
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100#" },
      :url =>"/system/:class/:id/:style/:basename.:extension",
      :path => ":rails_root/public/system/:class/:id/:style/:basename.:extension"
      
  has_attached_file :image_promo, :styles => { :medium => "1000x300>", :thumb => "100x100#" },
      :url =>"/system/:class/:id/:style/:basename.:extension",
      :path => ":rails_root/public/system/:class/:id/:style/:basename_promo.:extension"
      
 private
  def basename
    if self.img.dirty?
      new_filename = Time.now.to_i.to_s
      extension = File.extname(image_file_name).downcase
      self.img.instance_write :file_name, "#{new_filename}#{extension}"
      self.img_file_name = "#{new_filename}#{extension}"
    end
  end
  def basename_promo
    if self.img.dirty?
      new_filename = Time.now.to_i.to_s
      extension = File.extname(image_promo_file_name).downcase
      self.img.instance_write :file_name, "#{new_filename}#{extension}"
      self.img_file_name = "#{new_filename}_promo#{extension}"
    end
  end
end
