namespace DynamicsConsult.Helpdesk.Customer;

tableextension 70122 "Customer Ext" extends Customer
{
    fields
    {
        // esempio: nessun nuovo campo, solo validazione
        modify(Address)
        {
            trigger OnAfterValidate()
            begin
                CheckForPlusSign(Rec.Address);
            end;
        }
    }

    local procedure CheckForPlusSign(TextToVerify: Text)
    begin
        if StrPos(TextToVerify, '+') > 0 then
            Message('È stato trovato un segno "+" nell''indirizzo.');
    end;
}
