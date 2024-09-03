package house_exterior with SPARK_Mode is


   type ExteriorStatus is (Openable, Shut);

   type HouseExterior is tagged record
      status : ExteriorStatus;
   end record;

   procedure UpdateLocked (This : in out HouseExterior) with
     Pre'Class => This.status = Openable,
     Post'Class => This.status = Shut;
   

               
   procedure UpdateUnlocked (This : in out HouseExterior) with
     Pre'Class => This.status = Shut,
     Post'Class => This.status = Openable;
   
   function CreateExteriors return HouseExterior;

end house_exterior;
