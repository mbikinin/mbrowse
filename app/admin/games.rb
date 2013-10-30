# encoding: utf-8

ActiveAdmin.register Game do
  form :html => { :multiple => true  } do |f|
    f.inputs 'Игры' do
      f.input :categories, :as => :check_boxes do |a|
        a.inputs  do
          a.input :category, :label => 'Категория игры'
        end
      end
      f.input :platforms, :as => :check_boxes do |a|
        a.inputs  do
          a.input :platform, :label => 'Платформа игры'
        end
      end
      f.input :title, :label => 'Титл'
      f.input :short_text
      f.input :body, :input_html => { :class=> "mceEditor" }
      f.input :image, :as => :file, :multiple => true, :label => 'Изображение (300х300)'
      f.input :image_promo, :as => :file, :multiple => true, :label => 'Промо баннер (1000х300)'
      f.input :keywords
      f.input :descriptions
      f.input :is_active
      f.input :is_recomend
      f.input :is_best
      f.input :in_spec_block
      f.buttons
    end
    
  end
  index do
      column :id
      column "Название игры", :title
      column "Категории" do |f|
        (f.categories.map{|p| p.title }).join(' ')
      end
      column "Платформы" do |f|
        (f.platforms.map{|p| p.title }).join(' ')
      end
      column :short_text
      default_actions
  end
  
  controller do
    def create
        create! do |format|
          flash[:notice] = "ОК! Успешно создали"
          format.html { redirect_to admin_games_path }
        end
      end
  
      def update
        update! do |format|
          flash[:notice] = "ОК! Успешно изменили"
          format.html { redirect_to admin_games_path }
        end
      end
   end
  
end
