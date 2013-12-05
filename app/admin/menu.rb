# -*- encoding : utf-8 -*-

ActiveAdmin.register Menu do
  sortable_tree_member_actions
  config.sort_order = 'lft_asc'
 
  filter :title
  filter :id 
  
  menu  :label => "Управление меню", :priority=>1
  index do
    sortable_tree_columns
      column :id
      column :title ,:label =>  "Заголовок"
      column "Родительская категория" , :parent_id
      column "Участвует в меню" do |n|
        n.in_main? ? "Да" : "Нет"
      end
      column "Участвует подвале меню" do |n|
        n.in_footer? ? "Да" : "Нет"
      end
      column "Участвует в СПЕЦ меню" do |n|
        n.in_special? ? "Да" : "Нет"
      end
      
      
      column "Ссылка на страницу" do |m|
          link_to "#{m.uri}","http://#{request.host}/#{m.uri}", :target=>:blank
       end
      default_actions
  end
  form :html => { :multiple => true  } do |f|
    f.inputs 'Страницы' do
      f.inputs "Родительская категория", :class=> :menu do 
         select_tag 'menu[parent_id]', 
         options_for_select(
          Menu.all.map{|i|"#{'----' * i.depth} #{i.title}"}.insert(0, ["", ""]), 
          selected =  Menu.find_by_id(params[:id]) && !Menu.find_by_id(params[:id]).parent_id.nil? ?  Menu.find_by_id(params[:id]).id : nil
        )
       end
      f.input :title, :label => "Заголовок"
      f.input :uri, :label => "Куда ведет ссылка"
      f.input :in_main, :label => "Показывать в основном меню"
      f.input :in_special, :label => "Показывать в специальном меню"
      f.input :in_footer, :label => "Показывать в подвале"
      f.buttons

    end    
  end
  ###
  #   Controller
  ###
  controller do 
  include TheSortableTreeController::Rebuild

    def manage
      @top_menu = Menu.in_main.nested_set
      @footer_menu = Menu.in_footer.nested_set
      Menu.rebuild!
    end
    def create
      create! do |format|
        flash[:notice] = "ОК! Успешно создали"
        format.html { redirect_to admin_menus_path }
      end
    end
    def update
      update! do |format|
        flash[:notice] = "ОК! Успешно изменили"
        format.html { redirect_to admin_menus_path }
      end
    end
  end

end
