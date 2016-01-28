package body G_Fifo is

   ----------
   -- Read --
   ----------

    procedure Read (Element : out Any; Fifo : in out Storage) is
    begin
        if Fifo.Size > 0 then
            Element := Fifo.Store(Fifo.Read_Position);
            Fifo.Size := Fifo.Size - 1;
            if Fifo.Read_Position = Max_Size then
                Fifo.Read_Position := 1;
            else
                Fifo.Read_Position := Fifo.Read_Position + 1;
            end if;
        else
            raise Storage_Error;
        end if;

    end Read;

   -----------
   -- Write --
   -----------

   procedure Write (Element : in Any; Fifo : in out Storage) is
   begin
        if Fifo.Size < Max_Size then
            Fifo.Store(Fifo.Write_Position) := Element;
            Fifo.Size := Fifo.Size + 1;
            if Fifo.Write_Position = Max_Size then
                Fifo.Write_Position := 1;
            else
                Fifo.Write_Position := Fifo.Write_Position + 1;
            end if;
        else
            raise Storage_Error;
        end if;
   end Write;

end G_Fifo;
