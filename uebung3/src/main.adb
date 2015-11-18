with Linked_list;          use Linked_list;

procedure Main is

    testdaten : constant array (integer range <>) of integer :=
      (1, 27, 35, 123, -18, -9999999, 11111, 333, 2222);

    testdaten2 : constant array (integer range <>) of integer :=
      (1_000_000, 2_000_000, 20_000_000, 100000000, 200000000,
       16#12AB_CDEF#, 2#01011111111111111111111110111111#);

    ---------------------------------------------
    mein_anker : z_listelement;
    noch_ne_liste: z_listelement;
    ---------------------------------------------

begin

   for i in testdaten'range loop
      einfuegen (mein_anker, testdaten(i));
   end loop;
   put (mein_anker);

   new_line(3);

   for i in testdaten2'range loop
      einfuegen (noch_ne_liste, testdaten2(i));
   end loop;
   put (noch_ne_liste);

end Main;
