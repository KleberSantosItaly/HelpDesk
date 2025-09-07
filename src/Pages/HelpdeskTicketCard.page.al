page 50122 "Helpdesk Ticket Card"
{
    PageType = Card;
    SourceTable = "Helpdesk Ticket";
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Helpdesk Ticket Card'; // scheda del ticket

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General'; // dati principali
                field("Entry No."; Rec."Entry No.") { ApplicationArea = All; Editable = false; }
                field(Title; Rec.Title) { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; MultiLine = true; }
                field(Priority; Rec.Priority) { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
            }
            group(Integration)
            {
                Caption = 'Integration'; // integrazione con API esterna
                field("External URL"; Rec."External URL")
                {
                    ApplicationArea = All;
                    ToolTip = 'Endpoint GET returning JSON with a numeric "score".';
                }
                field("External Score"; Rec."External Score") { ApplicationArea = All; Editable = false; }
                field("Last Sync"; Rec."Last Sync") { ApplicationArea = All; Editable = false; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SyncFromAPI)
            {
                ApplicationArea = All;
                Caption = 'Sync from API'; // richiama l’API esterna
                Image = Refresh;

                trigger OnAction()
                var
                    Client: Codeunit "Ticket API Client";
                begin
                    // arricchisce il record con lo score esterno
                    Client.SyncTicket(Rec);
                    CurrPage.Update(true); // aggiorna la UI
                end;
            }
        }
    }
}
