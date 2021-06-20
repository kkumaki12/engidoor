module.exports = {
  plugins: [
    require('postcss-import'),
    require('postcss-flexbugs-fixes'),
    require('postcss-preset-env'),
    require('tailwindcss')('./app/javascript/css/tailwind.js'),
    require('autoprefixer')

    ({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    })
  ]
}