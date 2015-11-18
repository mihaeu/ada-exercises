package body Max is

   ---------
   -- max --
   ---------

   function max (a: any; b: any) return any is
   begin
        if a < b then
            return b;
        end if;
        return a;
   end max;

end Max;
