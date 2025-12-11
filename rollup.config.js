import resolve from "@rollup/plugin-node-resolve"

export default {
  input: "app/javascript/application.js",
  output: {
    name: 'publishing-platform-publishing-components',
    file: "app/assets/builds/application.js",
    format: "esm",
    inlineDynamicImports: true,
    sourcemap: true
  },
  plugins: [
    resolve()
  ]
}
