namespace DynamicsConsult.Helpdesk.Customer;

codeunit 70123 "Customer Validation"
{
    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterValidateEvent', 'Address', false, false)]
    local procedure Customer_OnAfterValidate_Address(var Rec: Record Customer; var xRec: Record Customer; CurrFieldNo: Integer)
    begin
        // Garante que o evento é do campo Address
        if CurrFieldNo = Rec.FieldNo(Address) then
            CheckForPlusSign(Rec.Address);
    end;

    local procedure CheckForPlusSign(TextToVerify: Text)
    begin
        if StrPos(TextToVerify, '+') > 0 then
            Message('È stato trovato un segno "+" nell''indirizzo.');
        // Error('Carattere "+" non consentito nell''indirizzo.');
    end;
    end;
}
