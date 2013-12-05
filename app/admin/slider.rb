# -*- encoding : utf-8 -*-
ActiveAdmin.register Slider do
  form :html => {:multipart => :true } do |f|
    f.inputs 'banners' do
      f.input :title
      f.input :platform
      f.input :link, :label =>  "Ссылка (весь баннер будет ссылкой)"
      f.input :body
      f.input :image
    end
    f.actions
  end

end
