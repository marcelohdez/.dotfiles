// transpile all .ts into .js
const v = {
  ags: pkg.version?.split(".").map(Number) || [],
  expect: [1, 8, 2],
};

if (v.ags[1] < v.expect[1] || v.ags[2] < v.expect[2]) {
  print(`Requires ags v${v.expect.join(".")}, using v${v.ags.join(".")}`);
  App.quit();
}

const out = `/tmp/ags-transpiled`;

async function setupCss() {
  const scss = `${App.configDir}/style.scss`;
  const css = `${out}/style.css`;

  try {
    await Utils.execAsync(`npx sass ${scss} ${css}`);
  } catch (error) {
    console.error(error);
  }

  App.applyCss(css, true);
}

await setupCss();
Utils.monitorFile(`${App.configDir}/style`, setupCss);

const entry = `${App.configDir}/main.ts`;
try {
  await Utils.execAsync([
    "npx",
    "bun",
    "build",
    entry,
    "--outdir",
    out,
    "--external",
    "resource://*",
    "--external",
    "gi://*",
    "--external",
    "file://*",
  ]);

  await import(`file://${out}/main.js`);
} catch (error) {
  console.error(error);
  App.quit();
}

export {};
