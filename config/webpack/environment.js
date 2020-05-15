const { environment } = require('@rails/webpacker')
const erb = require('./loaders/erb')
const webpack = require('webpack');

environment.plugins.append(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    // mapboxgl: 'mapbox-gl',
    // Popper: ['popper.js', 'default']
  })
)
environment.loaders.delete('nodeModules')
environment.loaders.prepend('erb', erb)
module.exports = environment
