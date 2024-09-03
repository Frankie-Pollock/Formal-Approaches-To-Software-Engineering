package Clean_Air with SPARK_Mode is


   
   type Carbon is range 0..8;
   type AirCon is (Disabled, Activated);
   
   TurnOnAt : constant Carbon := 8;
   TurnOffAt : constant Carbon := 0;
   CarbonIncrease : constant := 1;
   CarbonDecrease : constant := 4;
   
   type CleanAir is tagged record
      carb : Carbon;
      status : AirCon;
   end record;
   
   procedure Update (This : in out CleanAir) with
      Pre'Class => (This.carb in Carbon'Range) and (This.status in AirCon),
      -- This post-condition ensures that the carbon level is always within bounds. 
      Post => (This.carb in Carbon'Range) and 
              ((This.status = Activated and This.carb <= Carbon'Last - CarbonDecrease) or 
               (This.status = Disabled and This.carb <= Carbon'Last + CarbonIncrease));
   
      
   function CreateAirCon return CleanAir;
   

end Clean_Air;
