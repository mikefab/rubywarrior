module Helper

  def Helper.fit?(warrior)
    if warrior.health <=19 && warrior.health <= 19
      return true
    else
      return false
    end 
  end

  def Helper.siege?(warrior,health)
    (warrior.health<health) ? true : false
  end

  def Helper.shoot?(warrior)
    warrior.look.size.times do |t|
      [:forward,:backward].each do |dir|
        if t == 0 
          if warrior.look(dir)[t].to_s == "Wizard"
            return dir
          end
          if warrior.look(dir)[t].to_s == "Archer"
            return dir
          end

          if warrior.look(dir)[t].to_s == "Sludge"
            return dir
          end


        elsif t == 1
          if warrior.look(dir)[t].to_s == "Wizard" && warrior.look(dir)[t-1].to_s == "nothing"
            return dir
          end
          if warrior.look(dir)[t].to_s == "Archer" && warrior.look(dir)[t-1].to_s == "nothing"
            return dir
          end

          if warrior.look(dir)[t].to_s == "Sludge" && warrior.look(dir)[t-1].to_s == "nothing"
            return dir
          end


        elsif t == 2
          if warrior.look(dir)[t].to_s == "Wizard" && warrior.look(dir)[t-1].to_s == "nothing" && warrior.look(dir)[t-2].to_s == "nothing"
            return dir
          end
          if warrior.look(dir)[t].to_s == "Archer" && warrior.look(dir)[t-1].to_s == "nothing" && warrior.look(dir)[t-2].to_s == "nothing"
            return dir
          end

          if warrior.look(dir)[t].to_s == "Sludge" && warrior.look(dir)[t-1].to_s == "nothing" && warrior.look(dir)[t-2].to_s == "nothing"
            return dir
          end


        end
      end
    end
  return nil
  end
end
