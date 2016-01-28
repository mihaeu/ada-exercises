generic

    type Any is private;

    with procedure Put(Element : in Any) is <>;

package G_Fifo is

    type Storage is private;

    procedure Read (Element : out Any; Fifo : in out Storage);
    procedure Write (Element : in Any; Fifo : in out Storage);

private

    Max_Size : constant Integer := 10;
    type Storage_Array is array (1..Max_Size) of Any;

    type Storage is
        record
            Store          : Storage_Array;
            Read_Position  : Integer := 1;
            Write_Position : Integer := 1;
            Size           : Integer := 0;
        end record;

end G_Fifo;
