package body House with SPARK_Mode is

function Is_Carbon_Valid (This: House) return Boolean is
   begin
        -- Turn off warning that is not needed
        pragma Warnings (Off, "use 'Valid attribute instead");
      return This.air.carb in Carbon'Range;
      
   end Is_Carbon_Valid;
   
   
   procedure Update (This : in out House) is
   begin
      This.heating.Update;
   
      -- Check if heating is On
      if This.heating.status = On then
         -- Check if exterior is currently Unlocked before trying to lock it
         if This.exterior.status = Openable then
            UpdateLocked(This.exterior);
         end if;
      elsif This.heating.status = Off then
         -- Check if exterior is currently Locked before trying to unlock it
         if This.exterior.status = Shut then
            UpdateUnlocked(This.exterior);
         end if;
      end if;
   
      This.air.Update;
      This.appliances.UnlockLock;
   end Update;
end House;
