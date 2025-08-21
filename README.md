# Manual Comandi Batch Windows

## SET - Gestione Variabili

### Sintassi Base
```batch
set variabile=valore
set "variabile=valore con spazi"
echo %variabile%
> valore con spazi
```

### Varianti del Comando SET

#### 1. SET semplice (assegnazione)
```batch
set nome=Mario
set eta=25
set "messaggio=Ciao mondo"
echo %messaggio%
> Ciao mondo
```

#### 2. SET /P (input utente)
```batch
set /p nome="Inserisci nome: "
set /p eta="Quanti anni hai? "
```

#### 3. SET /A (calcoli matematici)
```batch
set /a risultato=5+3
set /a quadrato=%risultato%*%risultato%
set /a incremento=%quadrato%+1
```

**Operatori matematici supportati:**
- `+` addizione
- `-` sottrazione  
- `*` moltiplicazione
- `/` divisione
- `%` modulo (resto)
- `()` parentesi per priorità

#### 4. Visualizzare variabili
```batch
set                    # mostra tutte le variabili
set nome               # mostra variabili che iniziano con "nome"
echo %nome%            # stampa il valore della variabile
```

#### 5. Esempi avanzati
```batch
# Concatenazione
set nome=Mario
set cognome=Rossi
set "nomecompleto=%nome% %cognome%"

# Substring (estrazione caratteri)
set stringa=HelloWorld
set "primi3=%stringa:~0,3%"    # "Hel"
set "dal4=%stringa:~3%"        # "loWorld"

```

---

## ECHO - Stampa Output

### Sintassi Base
```batch
echo messaggio
echo "messaggio con spazi"
echo %variabile%
```

### Varianti del Comando ECHO

#### 1. ECHO normale
```batch
echo Ciao mondo
echo Il risultato è: %risultato%
echo.                          # stampa riga vuota
```

#### 2. ECHO OFF/ON (controllo visualizzazione comandi)
```batch
@echo off                      # nasconde tutti i comandi
echo on                        # mostra i comandi (default)
```

#### 3. Redirect output
```batch
echo Testo > file.txt          # scrive in file (sovrascrive)
echo Altro testo >> file.txt   # aggiunge al file
echo Messaggio > nul           # non stampa nulla
```

#### 4. Caratteri speciali
```batch
echo ^& ^| ^< ^>               # stampa & | < >
echo %%PATH%%                  # stampa %PATH%
echo "Virgolette: ""ciao"""    # stampa: Virgolette: "ciao"
```

---

## IF-ELSE - Strutture Condizionali

### Sintassi Base
```batch
if condizione (
    comando1
    comando2
) else (
    comando3
)
```

### Tipi di Confronto

#### 1. Confronto stringhe
```batch
if "%nome%"=="Mario" (
    echo Ciao Mario
) else (
    echo Non sei Mario
)

# Case insensitive
if /i "%risposta%"=="si" echo Hai detto sì
```

#### 2. Confronto numerico
```batch
if %eta% GTR 18 echo Maggiorenne
if %numero% EQU 10 echo È uguale a 10
if %voto% LEQ 5 echo Insufficiente
```

**Operatori di confronto:**
- `EQU` uguale (=)
- `NEQ` diverso (≠)
- `LSS` minore (<)
- `LEQ` minore uguale (≤)
- `GTR` maggiore (>)
- `GEQ` maggiore uguale (≥)

#### 3. Test esistenza file/cartelle
```batch
if exist file.txt echo Il file esiste
if exist C:\Cartella\ echo La cartella esiste
if not exist backup.txt echo File mancante
```

#### 4. Test variabili definite
```batch
if defined variabile echo La variabile è definita
if not defined nome set nome=Default
```

#### 5. IF annidati e ELSE IF
```batch
if %voto% GEQ 9 (
    echo Ottimo
) else if %voto% GEQ 7 (
    echo Buono  
) else if %voto% GEQ 6 (
    echo Sufficiente
) else (
    echo Insufficiente
)
```

#### 6. Operatori logici
```batch
# AND (tutti veri)
if %eta% GTR 18 if "%patente%"=="si" echo Puoi guidare

# OR (almeno uno vero) - usando GOTO
if %eta% LSS 18 goto minorenne
if "%studente%"=="si" goto minorenne
goto maggiorenne
:minorenne
echo Sconto studenti applicato
goto fine
:maggiorenne  
echo Prezzo pieno
:fine
```

---

## TEST - Verifiche e Controlli

I "test" in batch si fanno principalmente con **IF** e alcuni comandi specifici:

### 1. Test Esistenza
```batch
# File
if exist "file.txt" echo Trovato
if not exist "config.ini" echo Manca configurazione

# Cartelle
if exist "C:\Programmi\" echo Cartella trovata
if exist "%USERPROFILE%\Desktop" echo Desktop trovato
```

### 2. Test Codici di Errore (ERRORLEVEL)
```batch
copy file1.txt file2.txt
if %ERRORLEVEL% EQU 0 (
    echo Copia riuscita
) else (
    echo Errore nella copia
)

# Forma alternativa
copy file1.txt file2.txt
if errorlevel 1 echo Si è verificato un errore
```

### 3. Test Stringa Vuota
```batch
if "%input%"=="" echo Input vuoto
if not "%nome%"=="" echo Nome inserito
```

### 4. Test con FIND/FINDSTR
```batch
# Cerca testo in file
find "errore" log.txt >nul
if %ERRORLEVEL% EQU 0 echo Errore trovato nel log

# Cerca pattern
echo %PATH% | findstr "System32" >nul && echo System32 nel PATH
```

### 5. Test Numerici Avanzati
```batch
# Test se è numero
set /a test=%input% 2>nul
if "%test%"=="%input%" (
    echo È un numero
) else (
    echo Non è un numero
)

# Test range
if %numero% GEQ 1 if %numero% LEQ 100 echo Numero nel range 1-100
```

---

## Esempi Pratici Combinati

### Script di Backup con Test
```batch
@echo off
set /p cartella="Cartella da backuppare: "

if not exist "%cartella%" (
    echo ERRORE: Cartella non trovata
    pause
    exit /b 1
)

set "backup=backup_%date:~-4,4%%date:~-10,2%%date:~-7,2%"
mkdir "%backup%" 2>nul

xcopy "%cartella%\*" "%backup%\" /s /e /y
if %ERRORLEVEL% EQU 0 (
    echo Backup completato con successo
) else (
    echo Errore durante il backup
)
pause
```

### Menu Interattivo
```batch
@echo off
:menu
echo.
echo === MENU PRINCIPALE ===
echo 1. Mostra data
echo 2. Mostra utente  
echo 3. Esci
echo.
set /p scelta="Scegli (1-3): "

if "%scelta%"=="1" (
    echo Data: %date% %time%
    pause
    goto menu
) else if "%scelta%"=="2" (
    echo Utente: %USERNAME%
    pause  
    goto menu
) else if "%scelta%"=="3" (
    echo Arrivederci!
    exit /b
) else (
    echo Scelta non valida
    pause
    goto menu
)
```


## Comandi Base 

I comandi base sono i seguenti 

### del
Elimina un file specificato in path

`del <file_path>`

``` batch
del il_mio_file.txt
del ..\..\il_mio_file.txt
```

alcune utili flags

`/s` echo il nome del file
`/q` non richiede verifica
`/f` forza l'eleminazione

### mkdir
Crea una cartella al percorso specificato

`mkdir <file_path>`

```batch
mkdir cartella
mkdir ..\..\cartella
mkdir C:\Users\myUser\Desktop\cartella
```


### rmdir
Elimina una cartella specificata dal path

`rmdir <folder_path>`

```batch
mkdir cartella
mkdir ..\..\cartella
mkdir C:\Users\myUser\Desktop\cartella
```

Come per `del`

## Variabili generali e di ambiente

Alcune variabili sono definte `generali` quando sono utilizzabili sempre e definiscono determinati comportamenti spesso aggiornate da uno script o dal OS
### Esempli

`%ERRORLEVEL%` Errore di esecuzione numero
`%DATE%	` Data corrente
`%USERNAME%	` Username dello user loggato

Altre variabili sono definte `di ambiente` quando sono definite dal OS ed hanno copiti speciali come tenere traccia dei path di aclune applicazioni
### Esempli

`OS` Nome del OS
`TEMP` Percorso folder temporanea
`JAVA_HOME` Path JDK Java

