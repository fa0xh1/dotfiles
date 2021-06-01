#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

    item:      add an item inside the menu               {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu             {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator                  {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                         {pipe => ["command", "label", "icon"]},
    file:      include the content of an XML file        {file => "/path/to/file.xml"},
    raw:       any XML data supported by Openbox          {raw => q(...)},
    beg:       begin of a category                        {beg => ["name", "icon"]},
    end:       end of a category                          {end => undef},
    obgenmenu: generic menu settings                {obgenmenu => ["label", "icon"]},
    exit:      default "Exit" action                     {exit => ["label", "icon"]},

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to an icon or a valid icon name
#    * Category names are case insensitive. (X-XFCE and x_xfce are equivalent)

require "$ENV{HOME}/.config/obmenu-generator/config.pl";

## Text editor
my $editor = $CONFIG->{editor};

our $SCHEMA = [

    # Favorites
    {beg => ['Favorites', 'utilities-desktop-extra']},
        {sep => 'Terminal'},
        {item => ['urxvt',              'URxvt',            'terminal']},
        {item => ['xfce4-terminal',     'XFCE4 Terminal',   'terminal']},
        {sep => 'Office'},
        {item => ['libreoffice',        'LibreOffice',      'libreoffice-main']},
        {sep => 'File Manager'},        
        {item => ['pcmanfm-qt',         'PC Man FM Qt',     'file-manager']},
        {item => ['thunar',             'Thunar',           'thunar']},
        {sep => 'Internet'},
        {item => ['firefox',            'Firefox',          'firefox']},
        {item => ['chromium',           'Chromium',         'chromium']},
        {item => ['midori',             'Midori',           'midori']},
        {item => ['transmission',       'Transmission',     'transmission']},
        {item => ['telegram',           'Telegram',         'telegram']},
        {sep => 'Media'},
        {item => ['clementine',         'Clementine',       'clementine']},
        {item => ['vlc',                'VLC',              'vlc']},
        {item => ['gnome-screenshot', 'Screenshot',       'camera']},
        {sep => 'Editor'},
        {item => ['geany',              'Geany',            'geany']},
        {sep => 'System'},
        {item => ["xfce4-taskmanager",  'Taskmanager',      'gnome-system-monitor']},
        {item => ["hardinfo",           'Hardinfo',         'hardinfo']},
    {end => undef},

    #          COMMAND                 LABEL              ICON
    {item => ['xdg-open .',       'File Manager', 'system-file-manager']},
    {item => ['xterm',            'Terminal',     'utilities-terminal']},
    {item => ['xdg-open http://', 'Web Browser',  'web-browser']},
    {item => ['gmrun',            'Run command',  'system-run']},
    {sep => undef},

    # {item => ['exo-open --launch TerminalEmulator',                                 'Terminal',          'terminal']},
    # {item => ['exo-open --launch FileManager',                                      'File Manager',      'file-manager']},
    # {item => ['exo-open --launch WebBrowser ',                                      'Web Browser',       'webbrowser-app']},

    {sep => 'Categories'},

    #          NAME            LABEL                ICON
    {cat => ['utility',     'Accessories', 'applications-utilities']},
    {cat => ['development', 'Development', 'applications-development']},
    {cat => ['education',   'Education',   'applications-science']},
    {cat => ['game',        'Games',       'applications-games']},
    {cat => ['graphics',    'Graphics',    'applications-graphics']},
    {cat => ['audiovideo',  'Multimedia',  'applications-multimedia']},
    {cat => ['network',     'Network',     'applications-internet']},
    {cat => ['office',      'Office',      'applications-office']},
    {cat => ['other',       'Other',       'applications-other']},
    {cat => ['settings',    'Settings',    'applications-accessories']},
    {cat => ['system',      'System',      'applications-system']},

    {sep => undef},
    {pipe => ['/home/gh0zialfat1h/.config/openbox/bin/bl-places-pipemenu',         'Places',       'folder']},

    #             LABEL          ICON
    #{beg => ['My category',  'cat-icon']},
    #          ... some items ...
    #{end => undef},

    #            COMMAND     LABEL        ICON
    # {pipe => ['obbrowser', 'Disk', 'drive-harddisk']},

    ## Generic advanced settings
    #{sep       => undef},
    #{obgenmenu => ['Openbox Settings', 'applications-engineering']},
    #{sep       => undef},

    ## Custom advanced settings
    {sep => undef},
    {beg => ['Advanced Settings', 'applications-engineering']},

      # Configuration files
      {item => ["$editor ~/.conkyrc",              'Conky RC',    'text-x-generic']},
      {item => ["$editor ~/.config/tint2/tint2rc", 'Tint2 Panel', 'text-x-generic']},

      # obmenu-generator category
      {beg => ['Obmenu-Generator', 'accessories-text-editor']},
        {item => ["$editor ~/.config/obmenu-generator/schema.pl", 'Menu Schema', 'text-x-generic']},
        {item => ["$editor ~/.config/obmenu-generator/config.pl", 'Menu Config', 'text-x-generic']},

        {sep  => undef},
        {item => ['obmenu-generator -s -c',    'Generate a static menu',             'accessories-text-editor']},
        {item => ['obmenu-generator -s -i -c', 'Generate a static menu with icons',  'accessories-text-editor']},
        {sep  => undef},
        {item => ['obmenu-generator -p',       'Generate a dynamic menu',            'accessories-text-editor']},
        {item => ['obmenu-generator -p -i',    'Generate a dynamic menu with icons', 'accessories-text-editor']},
        {sep  => undef},

        {item => ['obmenu-generator -d', 'Refresh cache', 'view-refresh']},
      {end => undef},

      # Openbox category
      {beg => ['Openbox', 'openbox']},
        {item => ["$editor ~/.config/openbox/autostart", 'Openbox Autostart',   'text-x-generic']},
        {item => ["$editor ~/.config/openbox/rc.xml",    'Openbox RC',          'text-x-generic']},
        {item => ["$editor ~/.config/openbox/menu.xml",  'Openbox Menu',        'text-x-generic']},
        {sep => undef},
        {item => ['obmenu',                              'GUI Menu Editor',     'theme']},
        {item => ['obconf',                              'GUI Config Tool',     'theme']},
        {sep => undef},
        {item => ['openbox --restart',                   'Restart Openbox',     'openbox']},
        {item => ['openbox --reconfigure',               'Reconfigure Openbox', 'openbox']},
      {end => undef},
    {end => undef},

    # Preferences
    {beg => ['Preferences', 'theme']},
        {item => ['nitrogen',                               'Choose wallpaper',         'nitrogen']},
        {item => ['lxappearance',                           'Lxappearance',             'theme']},
        # {item => ['xfce4-appearance-settings',              'Xfce4 Appearance',         'preferences-desktop-theme']},
        {sep => undef},
        # {item => ['exo-preferred-applications',             'Preferred Applications',   'preferred-applications']},
        {item => ['system-config-printer',                  'Printing',                 'printer']},
        {item => ['pavucontrol',                            'Sound Preferences',        'multimedia-volume-control']},
        # {item => ['xfce4-settings-manager',                 'Xfce4 Settings Manager',   'preferences-desktop']},
        {sep => undef},
        # Openbox category
        {pipe => ['/home/gh0zialfat1h/.config/openbox/bin/bl-compositor',      'Compositor',      'compton']},
        {pipe => ['/home/gh0zialfat1h/.config/openbox/bin/bl-tint2-pipemenu',  'Tint2',        'tint2']},
        {item => ['tint2conf',          'Tint2 GUI',    'tint2conf']},
    {end => undef},

    {pipe => ['/home/gh0zialfat1h/.config/openbox/bin/bl-help-pipemenu',              'Help &amp; Resources',              'info']},
    {sep  => undef},
    
    # Exit and Log Out
    {beg => ['Log Out', 'gnome-session']},
        ## This uses the 'oblogout' menu
        {item => ['oblogout', 'OB Logout', 'user_icon']},
        {sep => undef},

        ## The xscreensaver lock command
        {item => ['xscreensaver-command -lock', 'Lock', 'system-lock-screen']},
        {sep => undef},

        ## Shutdown
        {item => ['gksu systemctl suspend',   'Suspend',   'system-suspend']},
        {item => ['gksu systemctl hibernate', 'Hibernate', 'system-hibernate']},
        {item => ['gksu systemctl reboot',    'Reboot',    'system-restart']},
        {item => ['gksu systemctl poweroff',  'Shutdown',  'gnome-session']},
    {end => undef},

    ## This option uses the default Openbox's "Exit" action
    {exit => ['Exit', 'application-exit']}
]
