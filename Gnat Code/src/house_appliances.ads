package house_appliances with SPARK_Mode is

   
   type Unlocked is (Fridge, Oven);
   type Locked is (Fridge, Oven);
   
   type HouseAppliances is tagged record
      statusUnlocked : Unlocked;
      statusLocked : Locked;
   end record;
   
   procedure UnlockLock (This : in out HouseAppliances) with
    Pre'Class =>
      (This.statusUnlocked = Fridge or This.statusUnlocked = Oven),
    Post =>
      ((This.statusUnlocked = Fridge and This.statusLocked = Oven) or
       (This.statusUnlocked = Oven and This.statusLocked = Fridge));

   
   function CreateFridge return HouseAppliances;
   

end house_appliances;
