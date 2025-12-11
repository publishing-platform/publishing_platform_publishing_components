import resolve from "@rollup/plugin-node-resolve"

export default {
  input: "app/javascript/application.js",
  output: {
    name: 'publishing-platform-publishing-components',
    file: "app/assets/builds/application.js",
    format: "umd",
    inlineDynamicImports: true,
    sourcemap: true
  },
  plugins: [
    resolve()
  ]
}
