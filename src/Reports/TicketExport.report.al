report 50125 "Ticket CSV Export"
{
    Caption = 'Ticket CSV Export'; // esportazione in CSV
    ProcessingOnly = true;         // nessun layout RDL/Word
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Ticket; "Helpdesk Ticket")
        {
            RequestFilterFields = Priority, Status; // filtri esposti nella request page
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Export Options';
                    field(FIncludeHeader; IncludeHeader)
                    {
                        ApplicationArea = All;
                        Caption = 'Include header row';
                    }
                }
            }
        }
    }

    var
        IncludeHeader: Boolean; // opzione intestazione

    trigger OnPostReport()
    var
        TempBlob: Codeunit "Temp Blob";
        OutStr: OutStream;
        InStr: InStream;
        FileName: Text;
        Line: Text;
        Arquivo: Text;
        R: Record "Helpdesk Ticket";
    begin
        TempBlob.CreateOutStream(OutStr);

        if IncludeHeader then
            OutStr.WriteText('EntryNo;Title;Priority;Status;ExternalScore;LastSync' + '\r\n');

        // Aplique os filtros escolhidos na request page ao seu Record local
        R.SetView(Ticket.GetView); // ou: R.CopyFilters(Ticket);

        if R.FindSet() then
            repeat
                Line :=
                    Format(R."Entry No.") + ';' +
                    R.Title + ';' +
                    Format(R.Priority) + ';' +
                    Format(R.Status) + ';' +
                    Format(R."External Score") + ';' +
                    Format(R."Last Sync");
                OutStr.WriteText(Line + '\r\n');
            until R.Next() = 0;

        TempBlob.CreateInStream(InStr);
        FileName := StrSubstNo('Tickets_%1.csv', Format(CurrentDateTime(), 0, 9));

        DownloadFromStream(InStr, 'Export Tickets', '', FileName, Arquivo);
        //File.DownloadFromStream(InStr, 'Export Tickets', '', FileName);
    end;

}
