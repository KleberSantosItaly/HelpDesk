
---

## ⚙️ Funzionalità principali

1. **Gestione ticket**  
   - Creazione, modifica e visualizzazione ticket con priorità e stato.
   - Campi per integrazione esterna: *External URL*, *External Score*, *Last Sync*.

2. **Integrazione API esterna**  
   - Da *Helpdesk Ticket Card* è possibile cliccare su **Sync from API**.  
   - Viene effettuata una richiesta GET all’URL specificato.  
   - Se la risposta contiene `{ "score": <numero> }`, il valore viene salvato in *External Score*.

3. **API REST Business Central**  
   - API esposta all’endpoint standard BC:  
     ```
     GET https://businesscentral.dynamics.com/api/kleber/helpdesk/v1.0/companies({companyId})/tickets
     ```

4. **Esportazione CSV**  
   - Da *Helpdesk Ticket List* è possibile lanciare il report **Ticket CSV Export**.  
   - L’utente scarica un file CSV con intestazione opzionale e valori filtrabili.

5. **Pagina iniziale (Role Center)**  
   - La pagina **Helpdesk Home** aggrega lista, azioni e accesso rapido al modulo.

---

## 🚀 Avvio rapido

1. Clonare il repository ed aprirlo in **Visual Studio Code**.  
2. Configurare `launch.json` con l’ambiente di destinazione (Sandbox).  
3. Pubblicare con `F5` o `AL: Publish`.  
4. Alla pubblicazione si aprirà la **Helpdesk Home**.  
5. Creare nuovi ticket, sincronizzare con API esterna o esportare CSV.

---

## 🛠️ Requisiti

- Microsoft Dynamics 365 Business Central (v. 26.x o successiva)  
- AL Language extension per Visual Studio Code  
- Sandbox abilitata allo sviluppo

---

## 📄 Licenza
Progetto a scopo didattico.  
© 2025 – Kleber Santos
