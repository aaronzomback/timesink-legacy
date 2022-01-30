const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*'
  ],
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ],
  theme: {
    colors: {
      'mystery-white': '#F5F7F9',
      'dark-theater-primary': '#222222',
      'dark-theater-medium': '#3B3B3B',
      'dark-theater-light': '#545454',
      'dark-theater-lightest': '#6E6E6E',
      'neon-blue-heavy': '#4987FF',
      'neon-blue-primary': '#7AA8FF',
      'neon-blue-light': '#ADC9FF',
      'neon-blue-lightest': "#E0EBFF",
      'gray-display-primary': '#D4D6DC',
      'gray-display-medium': '#E3E4E8',
      'gray-display-light': '#F1F2F4',
    },
    fontFamily: {
      sans: ['Graphik', 'sans-serif'],
      serif: ['Merriweather', 'serif'],
      'display-logo': ['AnoRegularW05Wide'],
      'display-alt': ['AnoRegularW05WideItalic'],
      'title-kingdom': ['SangBleuKingdom-Regular-WebS'],
      'primary': ['SangBleuOGSans-Regular-WebS'],
      'blog': ['Lyon Display Web'],
    },
      extend: {
        fontFamily: {
          sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        },
      },
  },
}
