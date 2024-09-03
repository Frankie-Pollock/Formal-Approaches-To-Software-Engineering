package body house_heating with SPARK_Mode is
   
   -- Procedure to update the heating system based on temperature thresholds
   procedure Update (This : in out HouseHeating) is
   begin
      -- Update status based on temperature thresholds
      if This.status = Off and This.temp <= TurnOnAt then
         This.status := On;
      elsif This.status = On and This.temp >= TurnOffAt then
         This.status := Off;
      end if;

      -- Adjust temperature based on status
      if This.status = On then
         This.temp := This.temp + TempIncrease;
      elsif This.status = Off then
         This.temp := This.temp - TempDecrease;
      end if;
   end Update;
  
   -- Function to create a new instance of HouseHeating with default status "Off" and temperature "18"
   function CreateHeating return HouseHeating is
      result : HouseHeating := (Status => Off, temp => 18);
   begin
      return result;
   end CreateHeating;
      
end house_heating;
