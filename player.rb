require "Helper"
class Player
include Helper
 
  def play_turn(warrior)
    should_shoot     =  Helper.shoot?(warrior)
    fit       =  Helper.fit?(warrior)
    @health ||=  warrior.health
    siege     =  Helper.siege?(warrior,@health) 
    diff      =  @health - warrior.health 
    
    if should_shoot
      if should_shoot.match(/forward/)
        warrior.shoot!
      else
        #warrior.pivot! 
        warrior.shoot!(:backward)
      end
    else

      if warrior.feel.wall?
        warrior.pivot!
      else
        if warrior.feel.empty?
          if siege
            if fit
              warrior.walk!              
            else
              warrior.walk!(:backward)
            end
          else
            if fit
              warrior.walk!
            else 
              warrior.rest!
            end
          end
        else
          if warrior.feel.captive?
            warrior.rescue!
          else
            warrior.attack!
          end
        end
      end
    end
    @health = warrior.health  
  end
end
