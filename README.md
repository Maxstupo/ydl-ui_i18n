## YDL-UI i18n
This repository contains [YDL-UI's](https://github.com/Maxstupo/ydl-ui) locale files.
<br><br>
YDL-UI supports multiple languages, the current user-interface language can be changed in `Settings > General`.

# Translating / Contributing
Wanting to contribute by translating YDL-UI to your language, or fix a typo?
<br><br>
Fork this repository, apply your changes (in a sub-folder, view the **Format** section for more information), then create a pull request or send me the file.
<br><br>
An ``about.txt`` file can be included, this file will be in each release of YDL-UI.

## Loading
YDL-UI will search for locale files within a directory called `locales` located in the same folder as the `ydl-ui.json` config file. Any file with the filename pattern `*.<language_code>.json` will be loaded from this directory. <br><br>The language code can be neutral (e.g. `en` or `zh`), specific (e.g. `en-us` or `zh-Hans`), or generic text. 
The language selection dropdown (in the `Settings` window) will display the language/country for each locale file. Generic text or codes unrecognized by your system will be displayed as plain text in the dropdown.

## Format
View the [default locale file](https://github.com/Maxstupo/ydl-ui_i18n/blob/master/locales/en/default.en.json) for an actual example.
<br><br>
Locale files use a JSON key-value format, each key represents a specific user-interface component. YDL-UI will use a default English translation for any entries that are not specified in the locale file.<br><br>Certain entries support the use of templates, these are words wrapped in braces and will be replaced before being displayed.<br><br>
`"preset_dialog.edit": "Edit Download Preset - {PresetName}"`<br>
The template `{PresetName}` will be replaced with the name of the preset before being displayed in the user-interface.<br><br>
Refer to the [default locale file](https://github.com/Maxstupo/ydl-ui_i18n/blob/master/locales/en/default.en.json) for available templates.<br>
***
Some entry values contain an ampersand (`&`) the character after this ampersand represents the access key for the button control.<br><br>
`"menustrip.file": "&File"`<br>
`Alt+F` will activate this menustrip button.<br><br>
`"menustrip.file.exit": "E&xit"`<br>
`Alt+X` will activate this menustrip button (while the file menustrip is open).

### License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details