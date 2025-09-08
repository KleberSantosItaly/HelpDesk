namespace DynamicsConsult.Helpdesk.Customer;

pageextension 70121 "Customer Card Ext" extends "Customer Card"
{
    layout
    {
        modify(Address)
        {

        }
    }

    local procedure CheckForPlusSign(TextToVerify: Text)
    begin
        if StrPos(TextToVerify, '+') > 0 then
            Message('È stato trovato un segno "+" nell''indirizzo.');
    end;
}
