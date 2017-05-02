const fs = require('fs')
const path = require('path')

const data = fs.readdirSync('./public/images/icons')
    .filter(x => x[0] !== ".")
    .map(category => ({
      category,
      icons: fs.readdirSync('./public/images/icons/' + category)
        .map(x => `/images/icons/${category}/${x}`)
    }))

const printCat = cat => `
    category = "${cat.category}",
    icons = [
      ${cat.icons.map(x => `"${x}"`).join(', \n')}
    ]
`

const print = categories =>
  `icons = [
    {
    ${categories.map(printCat).join('},\n{')}
    }
    ]`

fs.writeFileSync('icons.data', print(data))
console.log(print(data))
