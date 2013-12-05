# -*- encoding : utf-8 -*-
class Slider < ActiveRecord::Base
  attr_accessible :body, :title, :image, :link, :platform_id, :uri

  has_attached_file :image, :styles => { :main => "730x460#", :thumb=>"250x250#", :mini=>"86x52#" },
                    :url => "/system/:class/:style/:basename.:extension",
                    :path => ":rails_root/public/system/:class/:style/:basename.:extension"
  before_save :basename
  belongs_to :platform
  private
  def basename
    if self.image.dirty?
      new_filename = Time.now.to_i.to_s
      extension = File.extname(image_file_name).downcase
      self.image.instance_write :file_name, "#{new_filename}#{extension}"
      self.image_file_name = "#{new_filename}#{extension}"
    end
  end
end

