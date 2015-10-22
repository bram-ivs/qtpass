#ifndef SETTINGS_H
#define SETTINGS_H

#include <QSettings>
#include <QScopedPointer>

class Settings
{
public:
    Settings();
    bool usePass;
    bool useClipboard;
    bool useAutoclear;
    bool useAutoclearPanel;
    bool hidePassword;
    bool hideContent;
    bool addGPGId;
    int autoclearSeconds;
    int autoclearPanelSeconds;
    QString passStore;
    QString passExecutable;
    QString gitExecutable;
    QString gpgExecutable;
    QString pwgenExecutable;
    QString gpgHome;
    bool useWebDav;
    QString webDavUrl;
    QString webDavUser;
    QString webDavPassword;
    bool useTrayIcon;
    bool hideOnClose;
    bool startMinimized;
    bool useGit;
    bool usePwgen;
    bool useSymbols;
    int passwordLength;
    QString passwordChars;
    bool useTemplate;
    QString passTemplate;
    bool templateAllFields;
    bool autoPull;
    bool autoPush;
    QHash<QString, QString> profiles;
    QString profile;
    bool checkConfig();

private:
    QScopedPointer<QSettings> settings;

};

#endif // SETTINGS_H