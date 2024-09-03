package body Clean_Air with SPARK_Mode is

   procedure Update (This : in out CleanAir) is
   begin
      -- Check if the carbon level reaches the threshold to activate the air cleansing system
      if This.carb = TurnOnAt and This.status = Disabled then      
         This.status := Activated;
         -- Check if the carbon level reaches the threshold to deactivate the air cleansing system
      elsif This.carb = TurnOffAt then
         This.status := Disabled;
      end if;      
      -- Adjust the carbon level based on the current status of the air cleansing system
      if This.status = Activated then
         -- Decrease the carbon level by CarbonDecrease amount, ensuring it does not go below the minimum
         if This.carb - CarbonDecrease >= Carbon'First then
            This.carb := This.carb - CarbonDecrease;
         else
            This.carb := Carbon'First;
         end if;
      elsif This.status = Disabled then
         -- Increase the carbon level by CarbonIncrease amount, ensuring it does not exceed the maximum
         if This.carb + CarbonIncrease <= Carbon'Last then
            This.carb := This.carb + CarbonIncrease;
         else
            This.carb := Carbon'Last;
         end if;
      end if;
   end Update;
      
   function CreateAirCon return CleanAir is
      -- Initialize a new instance of CleanAir with default values
      result : CleanAir := (Status => (Disabled), carb => (0));
   begin
      return result;
   end CreateAirCon;
end Clean_Air;
