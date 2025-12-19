import Tab from '../../package/components/tab'
import ReorderableList from '../../package/components/reorderable-list'

// import { initAll } from '../../package/all'

// initAll()

// Find first reorderable list module to enhance.
const $reorderableList = document.querySelector('[data-module="reorderable-list"]')
if ($reorderableList) {
  new ReorderableList($reorderableList).init()
}