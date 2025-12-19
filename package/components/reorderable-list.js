import Sortable from 'sortablejs'

function ReorderableList ($module) {
  this.$module = $module
  this.$upButtons = this.$module.querySelectorAll('.js-reorderable-list-up')
  this.$downButtons = this.$module.querySelectorAll('.js-reorderable-list-down')
}

ReorderableList.prototype.init = function () {
  this.sortable = Sortable.create(this.$module, { // eslint-disable-line new-cap
    chosenClass: 'gem-c-reorderable-list__item--chosen',
    dragClass: 'gem-c-reorderable-list__item--drag',
    onSort: function () {
      this.updateOrderIndexes()
    }.bind(this)
  })

  if (typeof window.matchMedia === 'function') {
    this.setupResponsiveChecks()
  } else {
    this.sortable.option('disabled', true)
  }

  const boundOnClickUpButton = this.onClickUpButton.bind(this)
  for (let u = 0; u < this.$upButtons.length; u++) {
    this.$upButtons[u].addEventListener('click', boundOnClickUpButton)
  }

  const boundOnClickDownButton = this.onClickDownButton.bind(this)
  for (let d = 0; d < this.$downButtons.length; d++) {
    this.$downButtons[d].addEventListener('click', boundOnClickDownButton)
  }
}

ReorderableList.prototype.setupResponsiveChecks = function () {
  const tabletBreakpoint = '40.0625em' // ~640px
  this.mediaQueryList = window.matchMedia('(min-width: ' + tabletBreakpoint + ')')
  this.mediaQueryList.addListener(this.checkMode.bind(this))
  this.checkMode()
}

ReorderableList.prototype.checkMode = function () {
  this.sortable.option('disabled', !this.mediaQueryList.matches)
}

ReorderableList.prototype.onClickUpButton = function (e) {
  const item = e.target.closest('.gem-c-reorderable-list__item')
  const previousItem = item.previousElementSibling
  if (item && previousItem) {
    item.parentNode.insertBefore(item, previousItem)
    this.updateOrderIndexes()
  }
  // if triggered by keyboard preserve focus on button
  if (e.detail === 0) {
    if (item !== item.parentNode.firstElementChild) {
      e.target.focus()
    } else {
      e.target.nextElementSibling.focus()
    }
  }
}

ReorderableList.prototype.onClickDownButton = function (e) {
  const item = e.target.closest('.gem-c-reorderable-list__item')
  const nextItem = item.nextElementSibling
  if (item && nextItem) {
    item.parentNode.insertBefore(item, nextItem.nextElementSibling)
    this.updateOrderIndexes()
  }
  // if triggered by keyboard preserve focus on button
  if (e.detail === 0) {
    if (item !== item.parentNode.lastElementChild) {
      e.target.focus()
    } else {
      e.target.previousElementSibling.focus()
    }
  }
}

ReorderableList.prototype.updateOrderIndexes = function () {
  const $actions = this.$module.querySelectorAll('.gem-c-reorderable-list__actions')

  $actions.forEach(function ($action, index) {
    $action.querySelector('input').value = index + 1
  })
}

export default ReorderableList
