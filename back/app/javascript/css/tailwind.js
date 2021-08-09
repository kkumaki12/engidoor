module.exports = {
  purge: [
    './src/**/*.html',
    './src/**/*.vue',
    './src/**/*.jsx',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/forms'),
require('@tailwindcss/typography'),
require('@tailwindcss/aspect-ratio'),
  ],
    theme: {
      container: {
        center: true,
      },
    },
  
}
