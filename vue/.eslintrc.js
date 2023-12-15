module.exports = {
  root: true,
  env: {
    node: true,
    es2022: true
  },
  'extends': [
    'plugin:vue/vue3-essential',
    'eslint:recommended',
    'plugin:import/recommended'
  ],
  rules: {
    'no-unused-vars': 'off'
  },
  settings: {
    'import/resolver': {
      alias: {
        map: [
          ['@', './src'],
          ['vue-qrcode-reader', 'vue-qrcode-reader/dist/vue-qrcode-reader.umd.cjs'],
        ],
        extensions: ['.vue', '.js'],
      },
    },
  },
  parserOptions: {
    ecmaVersion: 2022,
  },
};
