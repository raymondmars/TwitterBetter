'use strict';

Twitter = {}
Twitter.settings ||= 
  bigger_font: true
  font_on_img: chrome.extension.getURL("/images/twitter19.png")
  font_off_img: chrome.extension.getURL("/images/twitter19_mono.png")

chrome.runtime.onInstalled.addListener (details) ->
    console.log('previousVersion', details.previousVersion)

chrome.tabs.onUpdated.addListener (tabId, changeInfo, tab) ->
    #console.log(tab.url)
    if tab.url.indexOf("twitter.com") >= 0
      chrome.pageAction.show(tabId)
      if Twitter.settings.bigger_font == true
        chrome.pageAction.setIcon({path: Twitter.settings.font_on_img,tabId: tabId})
      else
        chrome.pageAction.setIcon({path: Twitter.settings.font_off_img,tabId: tabId})

      chrome.tabs.sendMessage tab.id, { text: "set_font", setting: Twitter.settings } 

chrome.pageAction.onClicked.addListener (tab) ->
  #console.log 'Your clicked icon'
  if Twitter.settings.bigger_font == true
    chrome.pageAction.setIcon({path: Twitter.settings.font_off_img,tabId: tab.id})
    Twitter.settings.bigger_font = false
  else
    chrome.pageAction.setIcon({path: Twitter.settings.font_on_img,tabId: tab.id})
    Twitter.settings.bigger_font = true

  chrome.tabs.sendMessage tab.id, { text: "set_font", setting: Twitter.settings } #, (dom)->
    #console.log dom

  #console.log Twitter.settings.bigger_font

