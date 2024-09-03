-- main.adb

with Ada.Text_IO; use Ada.Text_IO;
with house; use house;
with house_heating; use house_heating;
with house_exterior; use house_exterior;
with Clean_Air; use Clean_Air;
with house_appliances; use house_appliances;

procedure Main with SPARK_Mode is

   system : house.House;

   procedure Print_Status is
      heating : HouseHeating := system.heating;
      exterior : HouseExterior := system.exterior;
      air : CleanAir := system.air;
      appliances : HouseAppliances := system.appliances;

   begin
      -- Clear the screen
      Put(ASCII.ESC & "[2J");
      Put_Line("Simulation of a House Eco Control System For Debugging");
      Put_Line("-------------------------------------------------------");
      Put_Line("Temperature: " & heating.temp'Image & "C, ");
      Put_Line("Heater Status: " &  heating.status'Image);
      Put_Line("Window and Exterior Doors Status: " & exterior.status'Image);
      Put_Line("Unlocked Appliance: " & appliances.statusUnlocked'Image);
      Put_Line("Locked Appliance: " & appliances.statuslocked'Image);
      Put_Line("Carbon Monoxide Levels: " & air.carb'Image & "PPM");
      Put_Line("Air Cleansing: " &  air.status'Image);
      Put_Line("-------------------------------------------------------");

      -- (simulation)
      delay 1.0;
   end Print_Status;

begin
   loop
      Print_Status;
      -- Invariant Check
      if Is_Carbon_Valid(system) then
         system.Update;
      else
         Put_Line("Carbon level outside valid range. Update skipped.");
      end if;
   end loop;
end Main;
