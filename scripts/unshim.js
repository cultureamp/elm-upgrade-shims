const { readFileSync, writeFileSync } = require("fs")
const { sync: glob } = require("glob")

const inDir = process.argv[2] || "src"
const filePaths = glob(`${inDir}/**/*.elm`)

/**
 * @typedef {{ path: string, content: string }} File
 */

/**
 * @param {string} path
 * @returns {File}
 */
const toFile = path => ({
  path,
  content: readFileSync(path).toString()
})

/**
 * @param {File} file
 * @returns {File}
 */
const unshim = file => ({
  ...file,
  content: file.content
    .split("\n")
    .map(line => line.split("Shims.").join(""))
    .join("\n")
})

console.log(`Removing shims from files:`)
filePaths.forEach(path => console.log(`\t${path}`))

filePaths
  .map(toFile)
  .map(unshim)
  .forEach(file => writeFileSync(file.path, file.content))
