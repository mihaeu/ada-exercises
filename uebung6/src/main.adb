with Ada.Text_IO;            use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;      use Ada.Float_Text_IO;

procedure Main is
    type My_Money is delta 0.01 digits 18;
    package My_FP_EA is new Ada.Text_IO.Decimal_IO(My_Money);
    use my_fp_ea;
    mSum : My_Money   := 0.0;
    iSum : Integer    := 0;
    fSum : Float      := 0.0;
begin
    for i in Integer range 1 .. 10_000 loop
        iSum := iSum + 80;
    end loop;

    for j in Integer range 1 .. 10_000 loop
        fSum := fSum + 0.8;
    end loop;

    for j in Integer range 1 .. 10_000 loop
        mSum := mSum + 0.8;
    end loop;


    Put_Line("----------------------------------------------------");
    Put_Line("80c:");
    Put_Line("----------------------------------------------------");

    Put("Integer Summe (80c): ");
    Put(iSum / 100);
    Put_Line("");
    Put("Integer USt. (80c): ");
    Put(iSum * 654 / 1_000_000);
    Put_Line("");
    Put("Float Summe (80c): ");
    Put(fSum);
    Put_Line("");
    Put("Float USt. (80c): ");
    Put(fSum * 0.0654);
    Put_Line("");
    Put("My_Money Summe (80c): ");
    Put(mSum);
    Put_Line("");
    Put("My_Money USt. (80c): ");
    Put(mSum * 0.0654);
    Put_Line("");

    Put_Line("----------------------------------------------------");
    Put_Line("75c:");
    Put_Line("----------------------------------------------------");
    iSum := 0;
    fSum := 0.0;
    mSum := 0.0;

    for i in Integer range 1 .. 10_000 loop
        iSum := iSum + 75;
    end loop;

    for j in Integer range 1 .. 10_000 loop
        fSum := fSum + 0.75;
    end loop;

    for j in Integer range 1 .. 10_000 loop
        mSum := mSum + 0.75;
    end loop;

    Put("Integer Summe (75c): ");
    Put(iSum / 100);
    Put_Line("");
    Put("Integer USt. (75c): ");
    Put(iSum * 654 / 1_000_000);
    Put_Line("");
    Put("Float Summe (75c): ");
    Put(fSum);
    Put_Line("");
    Put("Float USt. (75c): ");
    Put(fSum * 0.0654);
    Put_Line("");
    Put("My_Money Summe (75c): ");
    Put(mSum);
    Put_Line("");
    Put("My_Money USt. (75c): ");
    Put(mSum * 0.0654);
    Put_Line("");
    Put_Line("");



   null;
end Main;
