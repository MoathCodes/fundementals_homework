// ==========================
// Hospital Preloader Script
// ==========================

// 1) Rotating status messages
const words = [
  'Initializing appointment system. Please wait a moment.',
  'Loading hospital UML visualization data...',
  'Connecting to healthcare database. This may take a while.',
  'Setting up doctor-patient appointment interface.',
  'Preparing the healthcare system workflow diagram.',
  'Loading UML navigation tools. Almost there.',
  'Your healthcare journey is being mapped. Please wait.',
  'Configuring system components for appointment scheduling.',
  'Initializing healthcare workflow visualization.',
  'Preparing the hospital appointment scheduling system.',
  'Setting up interactive UML navigation features.',
  'Connecting all system components. Thank you for your patience.',
];

// 2) Heartbeat + pulse keyframes (now 100% → –100% for smooth wrap)
const heartbeatAnimation = `
@keyframes heartbeat {
  0%   { transform: translateX(100%); }
  90%  { transform: translateX(-100%); }
  100% { transform: translateX(-100%); }
}
@keyframes pulse {
  0%   { transform: scale(1); }
  15%  { transform: scale(1.25); }
  30%  { transform: scale(1); }
  45%  { transform: scale(1.15); }
  60%  { transform: scale(1); }
  100% { transform: scale(1); }
}
`;

// 3) Hospital-style loader UI
const loaderWidget = `
<div style="
    padding: 32px;
    font-smooth: always;
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
  ">
  <!-- Heart + title -->
  <div style="display: flex; align-items: center; margin-bottom: 24px;">
    <svg width="48" height="48" viewBox="0 0 24 24"
         xmlns="http://www.w3.org/2000/svg"
         style="animation: pulse 1.5s infinite;">
      <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5
               2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09
               C13.09 3.81 14.76 3 16.5 3
               19.58 3 22 5.42 22 8.5
               c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"
            fill="#e11d48"/>
    </svg>
    <div style="font-size: 28px; font-weight: 600; margin-left: 12px;">
      HealthFlow
    </div>
  </div>

  <!-- EKG line -->
  <div style="
      display: flex;
      justify-content: center;
      align-items: center;
      width: 300px;
      height: 60px;
      margin-bottom: 24px;
      overflow: hidden;
    ">
    <svg width="300" height="60" viewBox="0 0 300 60"
         style="animation: heartbeat 5s linear infinite alternate;">
      <path
        d="M0,30 L30,30 L40,10 L50,50 L60,20 L70,40
           L80,30 L100,30 L110,10 L120,50 L130,30
           L150,30 L160,10 L170,50 L180,30 L200,30
           L210,10 L220,50 L230,30 L250,30
           L260,10 L270,50 L280,30 L300,30"
        stroke="#e11d48"
        stroke-width="2"
        fill="none"/>
    </svg>
  </div>

  <!-- Title + rotating message -->
  <div style="font-size: 18px; font-weight: 500; margin-bottom: 8px;">
    Loading Hospital UML System
  </div>
  <div id="words" style="
      font-size: 16px;
      opacity: 0.7;
      font-weight: 400;
      text-align: center;
      max-width: 400px;
    ">
    ${words[Math.floor(Math.random() * words.length)]}
  </div>
</div>
`;

// 4) Config (now centered)
const shadcn_flutter_config = {
  loaderWidget,
  backgroundColor: null,
  foregroundColor: null,
  loaderColor: null,
  fontFamily: 'Geist Sans',
  fontSize: '24px',
  fontWeight: '400',
  mainAxisAlignment: 'center',
  crossAxisAlignment: 'center',
  transitionDuration: 500,
  externalScripts: [
    { src: 'https://cdn.jsdelivr.net/npm/@fontsource/geist-sans@5.0.3/400.min.css', type: 'stylesheet' },
    { src: 'https://cdn.jsdelivr.net/npm/@fontsource/geist-sans@5.0.3/300.min.css', type: 'stylesheet' },
  ],
};

// 5) Inject animations
function _injectAnimations() {
  const style = document.createElement('style');
  style.type = 'text/css';
  style.appendChild(document.createTextNode(heartbeatAnimation));
  document.head.appendChild(style);
}

// 6) ShadcnApp boilerplate
class ShadcnAppConfig {
  constructor({
    background, foreground,
    fontFamily, fontSize, fontWeight,
    mainAxisAlignment, crossAxisAlignment,
    loaderWidget, loaderColor, externalScripts,
    transitionDuration
  }) {
    this.background = background;
    this.foreground = foreground;
    this.fontFamily = fontFamily;
    this.fontSize = fontSize;
    this.fontWeight = fontWeight;
    this.mainAxisAlignment = mainAxisAlignment;
    this.crossAxisAlignment = crossAxisAlignment;
    this.loaderWidget = loaderWidget;
    this.loaderColor = loaderColor;
    this.externalScripts = externalScripts;
    this.transitionDuration = transitionDuration || 0;

    if (this.background == null)
      this.background = localStorage.getItem('shadcn_flutter.background') || '#09090b';
    if (this.foreground == null)
      this.foreground = localStorage.getItem('shadcn_flutter.foreground') || '#ffffff';
    if (this.loaderColor == null)
      this.loaderColor = localStorage.getItem('shadcn_flutter.primary') || '#3c83f6';
  }
}

class ShadcnAppThemeChangedEvent extends CustomEvent {
  constructor(theme) {
    super('shadcn_flutter_theme_changed', { detail: theme });
  }
}

class ShadcnAppTheme {
  constructor(background, foreground, primary) {
    this.background = background;
    this.foreground = foreground;
    this.primary = primary;
  }
}

class ShadcnApp {
  constructor(config) {
    this.config = config;
    this.onAppReady = this.onAppReady.bind(this);
    this.onThemeChanged = this.onThemeChanged.bind(this);
    this._didLoad = false;    // ← only load once
  }

  loadApp() {
    if (this._didLoad) return;      // ← hot‐reload guard
    this._didLoad = true;

    _injectAnimations();
    this.#initializeDocument();
    this.#loadExternalScripts(0);
    window.addEventListener('shadcn_flutter_app_ready', this.onAppReady);
    window.addEventListener('shadcn_flutter_theme_changed', this.onThemeChanged);
    if (globalThis.shadcnAppLoaded) this.onAppReady();
  }

  #loadExternalScripts(idx, done) {
    if (idx >= this.config.externalScripts.length) {
      if (done) done();
      return;
    }
    const srcObj = this.config.externalScripts[idx];
    let el;
    if (srcObj.type === 'stylesheet') {
      el = document.createElement('link');
      el.rel = 'stylesheet';
      el.href = srcObj.src;
    } else {
      el = document.createElement('script');
      el.type = srcObj.type || 'script';
      el.src = srcObj.src;
    }
    el.onload = () => this.#loadExternalScripts(idx + 1, done);
    (srcObj.type === 'stylesheet' ? document.head : document.body).appendChild(el);
  }

  #createStyleSheet(css) {
    const s = document.createElement('style');
    s.type = 'text/css';
    s.appendChild(document.createTextNode(css));
    document.head.appendChild(s);
  }

  #initializeDocument() {
    // ← prevent double-inject on hot reload
    if (document.getElementById('shadcn-loader-wrapper')) return;

    const wrapper = document.createElement('div');
    wrapper.id = 'shadcn-loader-wrapper';         // ← stable ID
    wrapper.style.cssText = `
      display: flex;
      justify-content: ${this.config.mainAxisAlignment};
      align-items: ${this.config.crossAxisAlignment};
      position: fixed; inset: 0;
      background-color: ${this.config.background};
      color: ${this.config.foreground};
      z-index: 9998;
      font-family: ${this.config.fontFamily};
      font-size: ${this.config.fontSize};
      font-weight: ${this.config.fontWeight};
      text-align: center;
      transition: opacity ${this.config.transitionDuration}ms;
      opacity: 1;
      pointer-events: initial;
    `;
    wrapper.innerHTML = this.config.loaderWidget;
    document.body.appendChild(wrapper);
    document.body.style.backgroundColor = this.config.background;

    // progress‐bar CSS + element (unchanged)
    const barCss = `
      .loader {
        height: 7px;
        background: repeating-linear-gradient(
          -45deg,
          ${this.config.loaderColor} 0 15px,
          #000 0 20px
        ) left/200% 100%;
        animation: l3 20s infinite linear;
        position: fixed; top:0; left:0; right:0;
        z-index: 9999;
      }
      @keyframes l3 { 100% { background-position: right; } }
    `;
    this.#createStyleSheet(barCss);
    const bar = document.createElement('div');
    bar.className = 'loader';
    wrapper.appendChild(bar);
  }

  onAppReady() {
    const wrapper = document.getElementById('shadcn-loader-wrapper');
    if (!wrapper) return;            // ← null-guard
    wrapper.style.opacity = 0;
    wrapper.style.pointerEvents = 'none';
    setTimeout(() => wrapper.remove(), this.config.transitionDuration + 50);

    globalThis.shadcnAppLoaded = true;
    window.removeEventListener('shadcn_flutter_app_ready', this.onAppReady);
  }

  onThemeChanged(e) {
    const t = e.detail;
    localStorage.setItem('shadcn_flutter.background', t.background);
    localStorage.setItem('shadcn_flutter.foreground', t.foreground);
    localStorage.setItem('shadcn_flutter.primary', t.primary);
  }
}


// 7) Expose & launch

globalThis.ShadcnApp = ShadcnApp;
globalThis.ShadcnAppConfig = ShadcnAppConfig;
globalThis.ShadcnAppTheme = ShadcnAppTheme;
globalThis.ShadcnAppThemeChangedEvent = ShadcnAppThemeChangedEvent;

const shadcn_flutter = new ShadcnApp(
  new ShadcnAppConfig(shadcn_flutter_config)
);

document.addEventListener('DOMContentLoaded', () => {
  shadcn_flutter.loadApp();
});
