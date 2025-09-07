page 50121 "Helpdesk Ticket List"
{
    PageType = List;
    SourceTable = "Helpdesk Ticket";
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Helpdesk Ticket List';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.") { ApplicationArea = All; }
                field(Title; Rec.Title) { ApplicationArea = All; }
                field(Priority; Rec.Priority) { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
                field("External Score"; Rec."External Score") { ApplicationArea = All; }
                field("Last Sync"; Rec."Last Sync") { ApplicationArea = All; }
            }
        }
    }
}
