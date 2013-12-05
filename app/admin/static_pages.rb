# -*- encoding : utf-8 -*-

ActiveAdmin.register StaticPage do

  filter :title
  filter :id
  filter :on_list?
  filter :on_main?
  
  menu  :label => "Статический контент"
  index do
      column :id
      column :title ,:label =>  "Заголовок"
      column "На главной" do |m|
        m.on_main? ? "Да" : "Нет"
      end
      column "Активный" do |a|
        a.on_list? ? "Да" : "Нет"        
      end 
      column "Ссылка на страницу" do |m|
          link_to "page/#{m.uri}","http://#{request.host}/page/#{m.uri}", :target=>:blank
       end
      default_actions
  end
  form :html => { :multiple => true  } do |f|
    f.inputs 'Страницы' do
      f.input :title, :label => "Заголовок"
      f.input :uri, :label => "Название ссылки (обязательно Латиница без пробелов). Пример: new_page <br/>".html_safe
      f.input :text, :label => "Текст", :input_html => { :class=> "mceEditor" }
      f.input :on_list, :label => "Активная"
      f.buttons
    end    
  end
  ###
  #   Controller
  ###

controller do
    def update
      update! do |format|
        flash[:notice] = "ОК! Успешно изменили"
        format.html { redirect_to :back }
      end
    end
  end
end
