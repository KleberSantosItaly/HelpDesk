page 50123 "Tickets API"
{
    PageType = API;
    SourceTable = "Helpdesk Ticket";
    APIVersion = 'v1.0';           // versione api
    APIPublisher = 'kleber';       // editore (minuscolo)
    APIGroup = 'helpdesk';         // gruppo
    EntityName = 'ticket';         // singolare
    EntitySetName = 'tickets';     // plurale
    Caption = 'Tickets API';       // espone OData/REST
    DelayedInsert = true;
    ODataKeyFields = "Entry No.";  // chiave OData

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(entryNo; Rec."Entry No.") { ApplicationArea = All; }
                field(title; Rec.Title) { ApplicationArea = All; }
                field(description; Rec.Description) { ApplicationArea = All; }
                field(priority; Rec.Priority) { ApplicationArea = All; }
                field(status; Rec.Status) { ApplicationArea = All; }
                field(externalScore; Rec."External Score") { ApplicationArea = All; }
                field(lastSync; Rec."Last Sync") { ApplicationArea = All; }
                field(externalUrl; Rec."External URL") { ApplicationArea = All; }
            }
        }
    }
}
