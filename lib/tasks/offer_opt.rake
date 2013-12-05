# -*- encoding : utf-8 -*-
namespace :opt do
  desc ""
  
  # Если юзер зареге-лся но не зашел в систему
  task :offer => :environment do
   arr = Hash.new
   Offer.all.each_with_index do |p|
     arr['name'] = p.name.strip
     arr['cpa'] = p.cpa.strip
     arr['epc7d'] = p.epc7d.strip
     arr['epc90d'] = p.epc90d.strip
     
     arr['category'] = p.category.strip.gsub(",",", ").gsub("  ", " ").gsub("   "," ")
     Category.create(:title=> arr['category'], :is_active=>1) unless Category.find_by_title arr['category']
     arr['description'] = p.description.strip
     arr['category_id'] = Category.find_by_title(arr['category']) ? Category.find_by_title(arr['category']).id : nil
     Offer.find_by_id(p.id).update_attributes(arr)
   end
  end
  
  task :img => :environment do
    Banner.where("id>4134").each do |b|
      p b.id
      arr = Hash.new
      if b.bannersrc.include? "."
        s = Paperclip::Geometry.from_file("http://cityads.ru#{b.bannersrc}")
        
          arr['is_active'] = 0 if s && s.width < 240
          arr['width'] = s.width
          arr['height'] = s.height
          Banner.find_by_id(b.id).update_attributes(arr) if Banner.find_by_id(b.id)

      else 
        b.delete
      end
    end
   
  end
end  
