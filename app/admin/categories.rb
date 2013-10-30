# encoding: utf-8

ActiveAdmin.register Category do
  form :html => {:multipart => :true } do |f|
    f.inputs 'Категории игр' do
      f.input :title
      f.input :is_active
    end
    f.actions
  end
  
  index do 
    column :id
    column :title
    column "Активный" do |n|
        n.is_active? ? "Да" : "Нет"
      end
    default_actions
  end
  
  controller do
    def create
        create! do |format|
          flash[:notice] = "ОК! Успешно создали"
          format.html { redirect_to admin_categories_path }
        end
      end
  
      def update
        update! do |format|
          flash[:notice] = "ОК! Успешно изменили"
          format.html { redirect_to admin_categories_path }
        end
      end
   end
  
end
