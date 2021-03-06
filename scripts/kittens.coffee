# Description:
#   Kittens!
#
# Dependencies:
#   None
#
# Configuration:
#   None
# 
# Commands:
#   hubot kitten me - A randomly selected kitten
#   hubot kitten me <w>x<h> - A kitten of the given size
#
# Author:
#   dstrelau

module.exports = (robot) ->
  robot.respond /kittens?(?: me)?$/i, (msg) ->
    msg.send kittenMe()

  robot.respond /kittens?(?: me)? (\d+)(?:[x ](\d+))?$/i, (msg) ->
    msg.send kittenMe msg.match[1], (msg.match[2] || msg.match[1])

kittenMe = (height, width)->
  h = height ||  Math.floor(Math.random()*250) + 250
  w = width  || Math.floor(Math.random()*250) + 250
  root = "http://placekitten.com"
  root += "/g" if Math.random() > 0.5 # greyscale kittens!
  return "#{root}/#{h}/#{w}#.png"
