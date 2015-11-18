with ada.text_io;          use ada.text_io;
with ada.integer_text_io;  use ada.integer_text_io;

package body Linked_list is

    procedure einfuegen (anker: in out z_listelement; information : integer) is
        iterator : z_listelement;
    begin
        if anker = null then                        -- 1. Fall: Liste leer
            anker :=
              new listelement'(information, null);
        elsif information < anker.all.info then     -- 2. Fall: vorn einfügen
            anker :=
              new listelement'(information, anker);
        else                                        -- 3. Fall: Einfügstelle suchen
            iterator := anker; -- zum Durchlaufen der Liste
            while iterator.naechst /= null loop
                if information > iterator.naechst.info then
                    iterator := iterator.naechst;
                    -- eigentlich    iterator.all.naechst.all.info
                    -- und           iterator.all.naechst;
                else
                    exit;
                end if;
            end loop;
            -- Nach Verlassen der Schleife sind wir an der
            -- richtigen Stelle. Es wird nach dem Element
            -- eingefügt, auf das iterator zeigt.
            -- (Funktioniert auch, falls iterator.naechst = null,
            -- also "Einfügen" hinter dem letzten Element)
            iterator.naechst :=
              new listelement'(information, iterator.naechst);
        end if;
    end einfuegen;

    procedure put (anker : z_listelement) is
        iterator : z_listelement := anker;
    begin
        while iterator/= null loop
            put (iterator.info);    -- eigentlich zeiger.all.info
            put (" ");
            iterator := iterator.naechst;
        end loop;
    end put;

end Linked_list;
