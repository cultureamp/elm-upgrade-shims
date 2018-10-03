import { readFileSync, writeFileSync } from "fs"
import { sync as glob } from "glob"

const inDir = process.argv[2] || "src"
const filePaths = glob(`${inDir}/**/*.elm`)

type File = { path: string; content: string }

const toFile = (path: string): File => ({
  path,
  content: readFileSync(path).toString()
})

const unshim = (file: File): File => ({
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
