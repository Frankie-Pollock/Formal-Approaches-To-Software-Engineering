with house_heating; use house_heating;
with house_exterior; use house_exterior;
with clean_air; use clean_air;
with house_appliances; use house_appliances;

package house with SPARK_Mode is
  

   

   type House is tagged record
      heating : HouseHeating := CreateHeating;
      exterior : HouseExterior := CreateExteriors;
      air : CleanAir := CreateAirCon;
      appliances: HouseAppliances := CreateFridge;
   end record;
         
   function Is_Carbon_Valid (This: House) return Boolean;
   
   procedure Update (This : in out House) with
    Pre'Class => 
      -- Make sure initial states are valid for operation
      (This.heating.temp in Temperature'Range and 
       This.heating.status in HeatingStatus'Range and
       This.exterior.status in ExteriorStatus'Range and
       This.appliances.statusUnlocked in Unlocked'Range and
       This.appliances.statusLocked in Locked'Range and
       This.air.carb in Carbon'Range and
       This.air.status in AirCon'Range),
    -- Ensure that carbon level and exterior security settings match post heating status  
    Post => 
      -- House heating influences the status of exterior
      ((This.heating.status = On and This.exterior.status = Shut) or 
       (This.heating.status = Off and This.exterior.status = Openable)) and
     -- Safety invariant maintained by carbon levels
     (This.air.carb in Carbon'Range);
   
end house;
