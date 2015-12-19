---------------------------------------------------------------------------
-- Programm    : \Uebung8\erz_verbr.adb
-- Verfasser   : T. Tempelmeier
-- Datum       : 17.10.07 15:47:49
-- Beschreibung: Erzeuger-Verbraucher-Problem mit Flußkontrolle   STACK
--               Einfache Demo-Version
--               In der Praxis: + generisch + eigenes Paket + protected TYPE
-- Änderungen  :
---------------------------------------------------------------------------

with Ada.Text_IO;               use Ada.Text_IO;
with Ada.Float_Text_IO;         use Ada.Float_Text_IO;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;

procedure Main is

   zufall : array (1 .. 5) of Float := (7.0, 3.0, 7.0, 12.0, 1.0);
   rand   : Generator;

   size : constant Positive := 10;
   type store_array is array (1 .. size) of Float;

   -----------------------------------------------------------

   protected stack is                   -- protected object
      entry push (item : in Float);
      entry pop (item : out Float);
   private
      index : Natural := 0;
      store : store_array;
   end stack;

   protected body stack is
      entry push (item : in Float) when index < size is
      begin                      -- falls Stack nicht voll
         index         := index + 1;
         store (index) := item;
      end push;
      entry pop (item : out Float) when index > 0 is
      begin                      -- falls Stack nicht leer
         item  := store (index);
         index := index - 1;
      end pop;
    end stack;

    protected fifo is
        entry get (item : out Float);
        entry put (item : in Float);
    private
        index : Natural := 0;
        store : store_array;

        count : Integer := 0;
        read_pos : Integer := 1;
        write_pos : Integer := 1;
    end fifo;

    protected body fifo is
        entry get (item : out Float) when index < size is
        begin
            item := store(index);
            count := count - 1;
            if write_pos = size then
                write_pos := 1;
            else
                write_pos := write_pos + 1;
            end if;
        end;
        entry put (item : in Float) when index > 0 is
        begin
            store(index) := item;
            count := count + 1;
            if read_pos = size then
                read_pos := 1;
            else
                read_pos := read_pos + 1;
            end if;
        end;
    end fifo;

   -- Wechselseitiger Ausschluß ist automatisch sichergestellt
   -- Flußkontrolle ist durch die when-Klauseln sichergestellt

   -----------------------------------------------------------

   task erzeuger;

   task body erzeuger is
      x : Float;
   begin
      Reset (rand);
      loop
         -- Empfange irgendwoher Daten oder erzeuge Daten
         x := Random (rand);  -- hier: zufälliger Wert

         delay Duration (x); -- zufällige Verzögerung der Task
         Put ("Erzeuger ");
         Put (x, 5, 1, 0);
         New_Line;

         -- Speichere Daten im Zwischenpuffer Stack
         stack.push (x);

      end loop;
   end erzeuger;

   -----------------------------------------------------------

   task verbraucher;

   task body verbraucher is
      x : Float;
   begin
      loop

         delay Duration
           (Random (rand) * 2.0); -- zufällige Verzögerung der Task

         -- Hole Daten aus Zwischenpuffer Stack
         stack.pop (x);

         -- Verarbeite Daten bzw. verbrauche Daten
         Put ("Verbraucher ");
         Put (x, 5, 1, 0);
         New_Line;

      end loop;
   end verbraucher;

-----------------------------------------------------------

begin

   Put_Line ("Die beiden Tasks laufen jetzt los!");

   Skip_Line;

end Main;
