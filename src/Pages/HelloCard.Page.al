page 50120 "Helpdesk Home"
{
    PageType = RoleCenter;
    ApplicationArea = All;
    Caption = 'Helpdesk Home'; // home page del modulo

    layout
    {
        area(RoleCenter)
        {
            group(Tickets)
            {
                Caption = 'Tickets';
                part(List; "Helpdesk Ticket List") { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(Sections)
        {
            group(Helpdesk)
            {
                action(OpenTickets)
                {
                    Caption = 'Ticket List';
                    ApplicationArea = All;
                    RunObject = page "Helpdesk Ticket List";
                }
                action(ExportTickets)
                {
                    Caption = 'Export CSV';
                    ApplicationArea = All;
                    RunObject = report "Ticket CSV Export";
                }
            }
        }
    }
}
