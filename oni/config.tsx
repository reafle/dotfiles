import * as React from "react"
import * as Oni from "oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
  console.log("config activated")

  // Input
  //
  // Add input bindings here:
  //
  oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"))

  //
  // Or remove the default bindings here by uncommenting the below line:
  //
  // oni.input.unbind("<c-p>")
}

export const deactivate = (oni: Oni.Plugin.Api) => {
  console.log("config deactivated")
}

export const configuration = {
  activate,
  "oni.hideMenu": "hidden",
  "ui.animations.enabled": true,
  "ui.fontSmoothing": "auto",
  "oni.loadInitVim": true,
  "oni.useDefaultConfig": false,
  "learning.enabled": false, // Turn off learning pane
  "sidebar.default.open": false, // the side bar collapse
  "editor.fontSize": "11px",
  "editor.fullScreenOnStart": true,

  // UI customizations
  // "sidebar.enabled": false, // sidebar ui is gone
  // "ui.colorscheme": "nord",
  //add custom config here, such as

  //"oni.bookmarks": ["~/Documents"],
  //"editor.fontSize": "12px",
  //"editor.fontFamily": "Monaco",
}
