require 'rubygems'
require 'choice'


Choice.options do
  
  header ''
  header ' Options:'

  option :debug, :required=>false do

    long  '--debug'
    desc  'Debug information'
    default false
  end 

  option :host, :required=>true do

    long  '--host'
    desc  'The host to check'
  end 
  
  option :type, :required=>true do

    short '-t'
    long  '--type'
    desc  'The temperature source'
  end

  option :warning, :required=>true do

    short '-w'
    long  '--warning'
    desc  'The warning threshold value'
    default 30
    cast Float
  end 

  option :critical, :required=>true do

    short '-c'
    long  '--critical'
    desc  'The critical threshold value'
    default 40
    cast Float
  end 

  separator ''
  separator ' Help:'
  
  option :help do
    short '-h'
    long  '--help'
    desc  'Show this help screen'
  end

  separator ''
end