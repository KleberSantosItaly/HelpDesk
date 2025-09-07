codeunit 50124 "Ticket API Client"
{
    procedure SyncTicket(var Ticket: Record "Helpdesk Ticket")
    var
        Client: HttpClient;                 // client http
        Response: HttpResponseMessage;      // risposta http
        Content: Text;                      // corpo della risposta
        Json: JsonObject;                   // root json
        Token: JsonToken;                   // token generico
        ScoreValue: Decimal;                // valore estratto
        Url: Text;
    begin
        // valida URL
        Url := Ticket."External URL";
        if Url = '' then begin
            if GuiAllowed() then
                Message('Defina o "External URL" antes de sincronizar.');
            exit;
        end;

        // richiesta GET
        if not Client.Get(Url, Response) then
            Error('HTTP GET falhou.');

        if not Response.IsSuccessStatusCode() then
            Error('Chiamata fallita. Status: %1', Response.HttpStatusCode());

        Response.Content().ReadAs(Content);

        // parsing JSON (atteso: { "score": <number> })
        if not Json.ReadFrom(Content) then
            Error('Risposta non è JSON valido.');

        if Json.Get('score', Token) and Token.IsValue() then
            ScoreValue := Token.AsValue().AsDecimal()
        else
            Error('Campo "score" non trovato o non numerico.');

        // aggiorna record
        Ticket.Validate("External Score", ScoreValue);
        Ticket.Validate("Last Sync", CurrentDateTime());
        Ticket.Modify(true);
    end;
}
