require 'nokogiri'
require 'colorize'

require 'komplement/version'
require 'komplement/base'

module Komplement
  HTML_ELEMENTS = %w[
    a abbr article aside audio b body br button canvas caption col colgroup
    comment datalist dd details div dl document dt em fieldset footer form g h1 h2
    h3 h4 h5 head header hgroup hr HTML html i iframe img input label legend li link
    math meta meter mfrac mi mn mo mrow msup nav noscript object ol optgroup option
    p parameter pre progress rect rt ruby script section select small source span
    strong style summary svg table tbody td template text textarea tfoot th thead
    title tr ul video xml #cdata-section
  ]
end
