table 50120 "Helpdesk Ticket"
{
    Caption = 'Helpdesk Ticket';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer) { Caption = 'Entry No.'; AutoIncrement = true; }
        field(2; Title; Text[100]) { Caption = 'Title'; }
        field(3; Description; Text[250]) { Caption = 'Description'; }
        field(4; Priority; Option) { Caption = 'Priority'; OptionMembers = Low,Normal,High; OptionCaption = 'Low,Normal,High'; }
        field(5; Status; Option) { Caption = 'Status'; OptionMembers = Open,"In Progress",Closed; OptionCaption = 'Open,In Progress,Closed'; }
        field(6; "External Score"; Decimal) { Caption = 'External Score'; DecimalPlaces = 0 : 5; }
        field(7; "Last Sync"; DateTime) { Caption = 'Last Sync'; }
        field(8; "External URL"; Text[250]) { Caption = 'External URL'; }
    }

    keys
    {
        key(PK; "Entry No.") { Clustered = true; }
    }
}