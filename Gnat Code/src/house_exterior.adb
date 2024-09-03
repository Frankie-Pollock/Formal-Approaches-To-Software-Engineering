package body house_exterior with SPARK_Mode is

   -- Procedure to update the status of the exterior to "Shut"
   procedure UpdateLocked (This : in out HouseExterior) is
   begin
      This.status := Shut;
   end UpdateLocked;

   -- Procedure to update the status of the exterior to "Openable"
   procedure UpdateUnlocked (This : in out HouseExterior) is
   begin
      This.status := Openable;
   end UpdateUnlocked;
   
   -- Function to create a new instance of HouseExterior with default status "Openable"
   function CreateExteriors return HouseExterior is
      result : HouseExterior := (status => Openable);
   begin
      return result;
   end CreateExteriors;

end house_exterior;
