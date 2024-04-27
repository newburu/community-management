import*as e from"postcss-js";import*as s from"picocolors";import*as t from"css-selector-tokenizer";import i from"../dist/utilities.js";import r from"../dist/base.js";import n from"../dist/unstyled.js";import o from"../dist/styled.js";import a from"../dist/utilities-unstyled.js";import l from"../dist/utilities-styled.js";import c from"./theming/themes.js";import d from"./theming/functions.js";import p from"./lib/utility-classes.js";import u from"./theming/index.js";import"./theming/themeDefaults.js";import"culori/require";var m={};function createPlugin(e,s){return{handler:e,config:s}}createPlugin.withOptions=function(e,s=(()=>({}))){const optionsFunction=function(t){return{__options:t,handler:e(t),config:s(t)}};optionsFunction.__isOptionsFunction=true;optionsFunction.__pluginFunction=e;optionsFunction.__configFunction=s;return optionsFunction};m=createPlugin;var f=m;var g=t;try{"default"in t&&(g=t.default)}catch(e){}var h={};const y=g;function itMatchesOne(e,s){return e.some((e=>s.search(e)>=0))}function parseAttrSelector(e){const{content:s}=e;const t=/(^class|^id)([*^?~|$=]*)+(?:("\s*)([^"\\]*?(?:\\.[^"\\]*)*?)(\s*")|('\s*)([^'\\]*?(?:\\.[^'\\]*)*?)(\s*'))/i;const[i,r,n,o,a]=s.split(t).filter((e=>e));return{type:i,operator:r,head:n,classes:o?o.split(" ").map((e=>e.replace(/"|'/g,""))):[],foot:a}}function attrStringify({type:e,operator:s,head:t,classes:i,foot:r}){return`${e}${s||""}${t||""}${i.join(" ")}${r||""}`}function prefixNode(e,s){if(["class","id"].includes(e.type))return{...e,name:`${s}${e.name}`};if(["attribute"].includes(e.type)&&e.content){const{type:t,operator:i,head:r,classes:n,foot:o}=parseAttrSelector(e);return["class","id"].includes(t)?{...e,content:attrStringify({type:t,operator:i,head:r,classes:n.map((e=>`${s}${e}`)),foot:o})}:e}return e}function iterateSelectorNodes(e,s){const{prefix:t,ignore:i}=s;return{...e,nodes:e.nodes.map((e=>["selector","nested-pseudo-class"].includes(e.type)?iterateSelectorNodes(e,s):itMatchesOne(i,y.stringify(e))?e:prefixNode(e,t)))}}
/**
 * @type {import('postcss').PluginCreator}
 */h=(e={})=>{const{prefix:s,ignore:t}={prefix:"",ignore:[],...e};if(typeof s!=="string")throw new Error("prefix option should be of type string.");if(!Array.isArray(t))throw new Error("ignore options should be an Array.");if(s.length)return{postcssPlugin:"addprefix",Root(e,i){e.walkRules((e=>{const i=y.parse(e.selector);const r=iterateSelectorNodes(i,{prefix:s,ignore:t});e.selector=y.stringify(r)}))}}};h.postcss=true;var $=h;var b={name:"daisyui",version:"4.10.2",description:"daisyUI - Tailwind CSS Components",author:"Pouya Saadeghi",license:"MIT",homepage:"https://daisyui.com",repository:{type:"git",url:"git+https://github.com/saadeghi/daisyui.git"},funding:{type:"opencollective",url:"https://opencollective.com/daisyui"},bugs:{url:"https://github.com/saadeghi/daisyui/issues"},keywords:["design-system","tailwindcss","components","ui-library","component","framework","tailwind","daisyui","theming","postcss","design","css","ui"],main:"src/index.js",typings:"src/index.d.ts",types:"src/index.d.ts",files:["src/lib/**/*.js","dist/*.js","dist/{themes,styled,unstyled,full}.css","src/index.js","src/theming/*.js","src/theming/*.d.ts","src/index.d.ts"],engines:{node:">=16.9.0"},browserslist:["> 7%"],publishConfig:{access:"public",branches:["master"]},scripts:{init:"npm install && npm run build && cd src/docs && npm install && npm run get-json --silent && cd src/experiments/playground && npm install",prettier:"prettier --write '**/*.{js,svelte,md,json,html,css}' --config src/.prettierrc.yaml --ignore-path src/.prettierignore",build:"node src/build","build:skipfullcss":"node src/build --skipfullcss",dev:"cd src/docs && npm run dev",playground:"cd src/experiments/playground && npm run dev",release:"node src/release","publish:alpha":"npm publish --tag=alpha",alpha:"npm run release -- --alpha && npm publish --tag=alpha"},devDependencies:{autoprefixer:"^10.4.16","commit-and-tag-version":"^12.0.0","postcss-cli":"10.1.0","postcss-import":"15.1.0","prejss-cli":"0.3.3",prettier:"^3.1.0","prettier-plugin-svelte":"^3.1.0","prettier-plugin-tailwindcss":"^0.5.7",tailwindcss:"^3.3.5"},dependencies:{"css-selector-tokenizer":"^0.8",culori:"^3",picocolors:"^1","postcss-js":"^4"}};var v=e;try{"default"in e&&(v=e.default)}catch(e){}var x=s;try{"default"in s&&(x=s.default)}catch(e){}var j={};const w=f;const S=v;const O=x;const _=$;const k=b;const I=i;const A=r;const U=n;const M=o;const N=a;const P=l;const C=c;const E=d;const F=p;let T=u;const mainFunction=({addBase:e,addComponents:s,config:t})=>{let i=false;t("daisyui.logs")!=false&&(i=true);if(i){console.log();console.log(`🌼   ${O.magenta("daisyUI")} ${O.dim(k.version)}`)}t("daisyui.base")!=false&&e(A);let r=M;t("daisyui.styled")==false&&(r=U);const n=t("daisyui.prefix");let o;if(n)try{o=S.sync(_({prefix:n,ignore:[]}))}catch(e){i&&console.error('Error occurred and prevent applying the "prefix" option:',e)}const a=n&&o;a&&(r=o(r));s(r);const l=E.injectThemes(e,t,C);l;if(t("daisyui.utils")!=false){s(I,{variants:["responsive"]});let e=N;a&&(e=o(e));s(e,{variants:["responsive"]});e=P;a&&(e=o(e));s(e,{variants:["responsive"]})}if(i){t("daisyui.styled")==false&&console.log(`├─ ${O.yellow("ℹ︎")} ${O.blue("styled")} ${O.reset("config is")} ${O.blue("false")} ${O.dim("\tcomponents won't have design decisions")}`);t("daisyui.utils")==false&&console.log(`├─ ${O.yellow("ℹ︎")} ${O.blue("utils")} ${O.reset("config is")} ${O.blue("false")} ${O.dim("\tdaisyUI utility classes are disabled")}`);t("daisyui.prefix")&&t("daisyui.prefix")!==""&&console.log(`├─ ${O.green("✔︎")} ${O.blue("prefix")} is enabled${O.dim("\t\tdaisyUI classnames must use")} ${O.blue(t("daisyui.prefix"))} ${O.dim("prefix")}`);l.themeOrder.length>0&&console.log(`├─ ${O.green("✔︎")} ${l.themeOrder.length} ${l.themeOrder.length>1?"themes":"theme"} added${O.dim("\t\thttps://daisyui.com/docs/themes")}`);l.themeOrder.length===0&&console.log(`├─ ${O.yellow("ℹ︎")} All themes are disabled in config${O.dim("\t\thttps://daisyui.com/docs/themes")}`);let e=[`${O.green("❤︎")} ${O.reset("Support daisyUI project:")}\t${O.dim(k.funding.url)}`,`${O.green("★")} ${O.reset("Star daisyUI on GitHub")}\t${O.dim("https://github.com/saadeghi/daisyui")}`];console.log(`╰─ ${e[Math.floor(Math.random()*e.length)]}`);console.log()}};j=w(mainFunction,{theme:{extend:{colors:{...T,"neutral-50":"#fafafa","neutral-100":"#f5f5f5","neutral-200":"#e5e5e5","neutral-300":"#d4d4d4","neutral-400":"#a3a3a3","neutral-500":"#737373","neutral-600":"#525252","neutral-700":"#404040","neutral-800":"#262626","neutral-900":"#171717","neutral-950":"#0a0a0a"},...F}}});var z=j;export{z as default};

