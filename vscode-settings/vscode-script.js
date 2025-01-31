// command-palette-blur.js
class CommandPaletteBlur {
    static CLASSES = {
        blur: 'command-palette-blur',
        workbench: '.monaco-workbench',
        dialog: '.quick-input-widget'
    };

    constructor() {
        this.observer = null;
        this.init();
    }

    init() {
        this.setupObservers();
        this.bindEvents();
    }

    setupObservers() {
        new MutationObserver(mutations => {
            const dialog = document.querySelector(CommandPaletteBlur.CLASSES.dialog);
            dialog && !this.observer && this.watchDialog(dialog);
        }).observe(document.body, { childList: true, subtree: true });
    }

    watchDialog(dialog) {
        this.observer = new MutationObserver(() => this.toggleBlur(!!dialog?.offsetParent));
        this.observer.observe(dialog, { attributes: true, attributeFilter: ['style'] });
    }

    toggleBlur(show) {
        const workbench = document.querySelector(CommandPaletteBlur.CLASSES.workbench);
        workbench?.classList.toggle(CommandPaletteBlur.CLASSES.blur, show);
    }

    bindEvents() {
        document.addEventListener('keydown', e => {
            if ((e.ctrlKey || e.metaKey) && e.key === 'p') e.preventDefault();
            if (e.key === 'Escape') this.toggleBlur(false);
        });
    }
}

new CommandPaletteBlur();


