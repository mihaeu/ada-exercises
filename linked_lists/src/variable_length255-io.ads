-------------------------------------------------------------------------------
-- Package VARIABLE_LENGTH.IO (specification)                                --
-- (C) Copyright 1997 ADALOG                                                 --
-- Author: J-P. Rosen                                                        --
--                                                                           --
-- Rights to use, distribute or modify this package in any way is hereby     --
-- granted, provided this header is kept unchanged in all versions and the   --
-- associated documentation file is distributed unchanged.                   --
-- Additionnal headers may be added. If you make a valuable addition,        --
-- please keep us informed by sending a message to rosen.adalog@wanadoo.fr   --
--                                                                           --
-- ADALOG is providing training, consultancy and expertise in Ada and        --
-- related software engineering techniques. For more info about our services:--
-- ADALOG                   Tel: +33 1 46 45 51 12                           --
-- 27, avenue de Verdun     Fax: +33 1 46 45 52 49                           --
-- 92170 VANVES             E-m: rosen.adalog@wanadoo.fr                     --
--                          URL: http://perso.wanadoo.fr/adalog              --
--                                                                           --
-- This package is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY  --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                      --
-------------------------------------------------------------------------------
with Text_IO; use Text_IO;
package variable_length255.IO is
   procedure Get_Line (File : in  File_Type; Item : out Variable_String);
   procedure Get_Line (Item : out Variable_String);

   procedure Put_Line (File : in File_Type; Item : in Variable_String);
   procedure Put_Line (Item : in Variable_String);

   procedure Put (File : in File_Type; Item : in Variable_String);
   procedure Put (Item : in Variable_String);

end variable_length255.IO;
