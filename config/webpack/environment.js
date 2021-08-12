const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
const path = require('path')

// Config
environment.config.merge(require('./config/resolve'))

environment.loaders.append('expose', {
    test: require.resolve('jquery', {
        paths: [ path.resolve(__dirname, '..', '..', 'vendor/theme/stisla/node_modules/jquery')]
    }),
    use: [
        { loader: 'expose-loader', options: '$'},
        { loader: 'expose-loader', options: 'jQuery'}
    ]
})

module.exports = environment
