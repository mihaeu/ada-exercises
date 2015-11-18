package Linked_list is

    type listelement;
    type z_listelement is access listelement;
    type listelement is record
        info : integer;
        naechst: z_listelement;
    end record;

    procedure einfuegen (anker: in out z_listelement; information : integer);
    procedure put (anker : z_listelement);

end Linked_list;
