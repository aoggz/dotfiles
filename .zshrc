// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    updateChannel: 'stable',

    fontSize: 15,
    fontFamily: '"Droid Sans Mono for Powerline", "DroidSansMono Nerd Font", "BlexMono Nerd Font Mono", "MesloLGLDZ Nerd Font", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
    fontWeight: 'normal',
    fontWeightBold: 'bold',

    cursorColor: 'rgba(248,28,229,0.8)',
    cursorAccentColor: '#000',
    cursorShape: 'BLOCK',
    cursorBlink: false,

    foregroundColor: '#fff',
    backgroundColor: '#000',
    selectionColor: 'rgba(248,28,229,0.3)',
    borderColor: '#C839C5',
    css: '',
    termCSS: '',

    showHamburgerMenu: false,
    showWindowControls: false,
    padding: '12px 14px',

    colors: {
      black: '#000000',
      red: '#C51E14',
      green: '#1DC121',
      yellow: '#C7C329',
      blue: '#0A2FC4',
      magenta: '#C839C5',
      cyan: '#20C5C6',
      white: '#C7C7C7',
      lightBlack: '#686868',
      lightRed: '#FD6F6B',
      lightGreen: '#67F86F',
      lightYellow: '#FFFA72',
      lightBlue: '#6A76FB',
      lightMagenta: '#FD7CFC',
      lightCyan: '#68FDFE',
      lightWhite: '#FFFFFF',
    },

    MaterialTheme: {
        theme: '',
        backgroundOpacity: '1',
        accentColor: '#64FFDA',
        vibrancy: 'dark'
    },

    shell: '',
    shellArgs: ['--login'],
    env: {},
    bell: 'SOUND',
    copyOnSelect: false,
    defaultSSHApp: true,
  },

  plugins: [
    "gitrocket", 
    "hyper-material-theme", 
    "hyperpower", 
    "hyper-search", 
    "hyper-statusline",
    "hyper-tabs-enhanced"
  ],
  localPlugins: [],

  keymaps: { },
};
