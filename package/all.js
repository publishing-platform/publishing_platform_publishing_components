import Tab from './components/tab'
import ReorderableList from './components/reorderable-list'

function initAll (options) {
  // Set the options to an empty object by default if no options are passed.
  options = typeof options !== 'undefined' ? options : {}

  // Allow the user to initialise components in only certain sections of the page
  // Defaults to the entire document if nothing is set.
  const scope = typeof options.scope !== 'undefined' ? options.scope : document

  // Initialize components here

  // Find first reorderable list module to enhance.
  const $reorderableList = scope.querySelector('[data-module="reorderable-list"]')
  if ($reorderableList) {
    new ReorderableList($reorderableList).init()
  }
}

export {
  initAll,
  Tab,
  ReorderableList
}
