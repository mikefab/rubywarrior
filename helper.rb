module Helper

  ENEMIES = ["Wizard","Archer","Sludge"]

  def Helper.fit?(warrior)
    warrior.health >= 19
  end

  def Helper.siege?(warrior,health)
    warrior.health<health
  end

  def Helper.shoot?(warrior)
    warrior.look.size.times do |t|
      [:forward,:backward,:left,:right].each do |dir|
        ENEMIES.each do |enemy|
          if warrior.look(dir)[t].to_s == "#{enemy}"
            flag = 1
            t.times do |t2|
              flag = 0 unless  warrior.look(dir)[t-(t2+1)].to_s == "nothing"
            end
            return dir if flag == 1
          end
        end
      end
    end
   return nil
  end
end
