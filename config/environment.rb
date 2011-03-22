require 'java'
require 'rubygems'
require 'bundler'
Bundler.setup

require 'rack'
require 'sinatra'
require 'haml'
require 'json'

root_path = File.expand_path(File.join(File.dirname(__FILE__), '..'))
Dir.chdir      root_path
set     :root, root_path

# We're using r68 from trunk because of an HTML encoding fix
require 'jars/boilerpipe-1.1.0.jar'
require 'jars/nekohtml-1.9.13.jar'
require 'jars/xerces-2.9.1.jar'

java_import "java.net.URL"
java_import "de.l3s.boilerpipe.extractors.ArticleExtractor"
java_import "de.l3s.boilerpipe.extractors.ArticleSentencesExtractor"
java_import "de.l3s.boilerpipe.extractors.KeepEverythingWithMinKWordsExtractor"
java_import "de.l3s.boilerpipe.extractors.DefaultExtractor"
java_import "de.l3s.boilerpipe.extractors.LargestContentExtractor"
java_import "de.l3s.boilerpipe.extractors.NumWordsRulesExtractor"
java_import "de.l3s.boilerpipe.sax.HTMLHighlighter"

require 'extractomatic'