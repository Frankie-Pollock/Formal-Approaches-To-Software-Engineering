package body house_appliances with SPARK_Mode is

   procedure UnlockLock (This : in out HouseAppliances) is
   begin
      -- Toggle between unlocking Fridge and Oven
      if This.statusUnlocked = Fridge then
         -- Switch from Fridge to Oven
         This.statusUnlocked := Oven;
         This.statusLocked := Fridge;
      elsif This.statusUnlocked = Oven then
         -- Switch from Oven to Fridge
         This.statusUnlocked := Fridge;
         This.statusLocked := Oven;
      else
         -- Default case, switch to Oven if neither Fridge or Oven is unlocked
         This.statusUnlocked := Oven;
      end if;
   end UnlockLock; 
        
        
   function CreateFridge return HouseAppliances is   
      -- Initialize a new instance of HouseAppliances with Fridge unlocked and Oven locked
      result : HouseAppliances := (statusUnlocked => Fridge, statuslocked => Oven);      
   begin      
      return result;           
   end CreateFridge;

end house_appliances;
