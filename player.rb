class Player
  def play_turn(warrior)
    @health ||= warrior.health
    siege = (warrior.health<@health) ? true : false
    if warrior.feel.wall?
      warrior.pivot!
    else
      if warrior.feel.empty?
        if siege
          if warrior.health < 10
            warrior.walk!(:backward)
          else
            warrior.walk!
          end
        else
          if warrior.health <= 19 
            warrior.rest!
          else 
            warrior.walk!
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
    @health = warrior.health  
    # add your code here
  end
end
