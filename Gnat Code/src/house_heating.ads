package house_heating with SPARK_Mode is


   type HeatingStatus is (On, Off);
   type Temperature is range 17..19;
  
   TurnOnAt : constant Temperature := 17;
   TurnOffAt : constant Temperature := 19;
   TempIncrease : constant := 1;
   TempDecrease : constant := 1;
   

   type HouseHeating is tagged record
      temp : Temperature;
      status : HeatingStatus;
   end record;
   
   procedure Update (This : in out HouseHeating) with
   Pre'Class => (This.temp in Temperature'Range),
   Post => (
     (This.status = On and This.temp'Old < TurnOnAt and This.temp = This.temp'Old + TempIncrease) or
     (This.status = Off and This.temp'Old > TurnOffAt and This.temp = This.temp'Old - TempDecrease) or
     -- Cover unchanged scenarios
     (This.status = Off and This.temp'Old <= TurnOffAt) or
     (This.status = On and This.temp'Old >= TurnOnAt)
   );


   
   function CreateHeating return HouseHeating;
   

end house_heating;
