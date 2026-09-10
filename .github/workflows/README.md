# AdBloker Local

Adblocker nativo per Windows 7 e successivi. Usa il file `hosts` di Windows e protegge Chrome, Firefox, Internet Explorer e gli altri browser senza estensioni o driver.

## Compilazione
Installare Visual Studio 2017 o Build Tools con **.NET Framework 4.7.2 Developer Pack** e il workload **.NET desktop development**.

Per generare l'eseguibile, fare doppio clic su `build-release.bat` oppure eseguire da un Prompt dei comandi per sviluppatori:

```bat
msbuild AdBloker.sln /t:Rebuild /p:Configuration=Release /p:Platform=AnyCPU
```

Il file generato sara' `AdBloker\bin\Release\AdBloker.exe`. Avviarlo come amministratore: il programma crea un backup prima della prima modifica.

## Installer completo
Per creare un unico installer `.exe` che installa anche il requisito .NET automaticamente:

1. Installa **Inno Setup 6** sul PC di compilazione.
2. Scarica il web installer ufficiale di **.NET Framework 4.7.2** e salvalo come `redist\NDP472-Web.exe`.
3. Esegui `build-installer.bat`.

Il pacchetto finale sara' `dist\AdBloker-Setup.exe`. Durante l'installazione controlla se .NET 4.7.2 e' gia' presente e installa il runtime incluso solo quando necessario.

## Compilazione dal Chromebook
Se il Chromebook non offre l'ambiente Linux, usa GitHub Actions:

1. Crea un repository GitHub e carica tutti i file del progetto.
2. Vai nella scheda **Actions** e avvia **Build Windows installer** con **Run workflow**.
3. Al termine apri la compilazione completata, scarica l'artifact `AdBloker-Windows-Installer` e estrai `AdBloker-Setup.exe`.

La compilazione viene eseguita su una macchina Windows di GitHub. Non serve installare .NET o Visual Studio sul Chromebook.

Il filtro blocca domini pubblicitari e tracker. Non puo' rimuovere annunci serviti dallo stesso dominio del contenuto e non sostituisce un antivirus.